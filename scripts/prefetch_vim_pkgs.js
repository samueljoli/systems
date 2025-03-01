#!/usr/bin/env node
const https = require('https');
const { exec } = require('child_process');
const { promisify } = require('util');
const execPromise = promisify(exec);
const { log, error } = console

/**
 * Query the GitHub Search API for a repository matching the plugin name.
 * Returns a Promise resolving to an object with { owner, repo }.
 */
function fetchGitHubRepo(plugin) {
  const options = {
    hostname: 'api.github.com',
    path: `/search/repositories?q=${encodeURIComponent(plugin)}+in:name`,
    headers: {
      'User-Agent': 'node.js' // GitHub API requires a user-agent header
    }
  };

  return new Promise((resolve, reject) => {
    https.get(options, (res) => {
      let data = '';
      res.on('data', chunk => data += chunk);
      res.on('end', () => {
        try {
          const json = JSON.parse(data);
          if (json.total_count === 0 || !json.items || json.items.length === 0) {
            return reject(`No repository found for "${plugin}"`);
          }
          // Choose the first matching repository
          const repo = json.items[0];
          resolve({ owner: repo.owner.login, repo: repo.name });
        } catch (err) {
          reject(`Error parsing JSON for "${plugin}": ${err}`);
        }
      });
    }).on('error', err => reject(`HTTP error for "${plugin}": ${err}`));
  });
}

/**
 * Uses nix-prefetch-github to fetch the commit revision and sha256 hash.
 * Returns a Promise resolving to the parsed JSON output.
 */
async function fetchNixPrefetch(owner, repo, head) {
  const cmd = `nix-prefetch-github ${owner} ${repo} --rev ${head}`;
  try {
    const { stdout } = await execPromise(cmd);
    return JSON.parse(stdout);
  } catch (err) {
    throw new Error(`Error running nix-prefetch-github for ${owner}/${repo}: ${err}`);
  }
}

/**
 * Main function: For each plugin, search GitHub and print out the Nix expression.
 */
async function main(plugins, head) {
  for (const plugin of plugins) {
    log(`Searching GitHub for repository matching "${plugin}"...`);

    try {
      const { owner, repo } = await fetchGitHubRepo(plugin);

      log(`Found: ${owner}/${repo}`);
      log(`Fetching prefetch info for ${owner}/${repo}...`);

      const prefetchData = await fetchNixPrefetch(owner, repo, head);

      const { rev, hash } = prefetchData;
      if (!rev || !hash) {
        error(`Incomplete data for "${plugin}". Skipping...`);
        continue;
      }

      // Output the Nix expression
      log(`\n${plugin} = pkgs.vimUtils.buildVimPlugin {`);
      log(`  name = "${plugin}";`);
      log(`  src = pkgs.fetchFromGitHub {`);
      log(`    owner = "${owner}";`);
      log(`    repo = "${repo}";`);
      log(`    rev = "${rev}";`);
      log(`    sha256 = "${hash}";`);
      log(`  };`);
      log(`};\n`);
    } catch (err) {
      error(`Error processing "${plugin}": ${err}`);
    }
  }
}

const plugins = [
  "" // NOTE: Add plugins and run script
];

main(plugins, 'main');
