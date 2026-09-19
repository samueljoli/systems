## Design Standards

For any code review, architecture discussion, API or library design, module
decomposition, refactoring, system design, or error-handling decision, load and
apply the `philosophy-of-software-design` skill before making design judgments.

Read:

```
~/.agents/skills/philosophy-of-software-design/SKILL.md
```

Treat `SKILL.md` as the canonical workflow. Load supporting references from the
skill when relevant, especially:

```
references/red-flags.md
references/principles.md
references/complexity.md
references/abstractions.md
```

Do not apply the principles as a mechanical checklist. Begin by identifying the
complexity being managed, including:

* change amplification
* cognitive load
* unknown unknowns

Then evaluate whether the design reduces that complexity through appropriate
abstractions, information hiding, deep modules, complexity placement, and other
principles defined by the skill.

For consequential design decisions, consider materially different alternatives
("design it twice") rather than evaluating only the first proposed design.

When reviewing an existing design or implementation, distinguish between:

1. **Principle adherence** — whether the design follows the philosophy, supported
   by concrete evidence from the code or architecture.
2. **Outcome** — what effect the design actually had or is expected to have on
   complexity, change amplification, cognitive load, interface stability, and
   maintainability.

Do not claim that a principle was followed without evidence. Do not assume that
following a principle means the resulting design is successful.

Use the skill's Red Flags reference when evaluating existing code and call out
specific red flags when present.

