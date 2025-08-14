local status_ok, claude = pcall(require, "claude-code")

if not status_ok then
	return
end

claude.setup()
