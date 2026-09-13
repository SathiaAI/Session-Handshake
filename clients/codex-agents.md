# Install for Codex (and other AGENTS.md tools)

OpenAI Codex — and a growing set of agents (Jules, Zed, Factory, and others) — read an
**`AGENTS.md`** file at the project root. Add the section below to your `AGENTS.md` (create
the file if it doesn't exist). Then trigger it by telling Codex to "run the session handshake."

```md
## Session Handshake

When I say "session handshake", "handoff", "save context", or "wrap up the session", write a
file named `HANDOFF.md` in the project root so a fresh session — possibly a different AI on a
different tool — can resume with zero loss of context.

First inspect real state: `git status` and `git log --oneline -20`, cite real commit hashes
(if not git, inspect the real artifacts). If `HANDOFF.md` already exists, archive it as
`HANDOFF-archive-YYYY-MM-DD-HHMM.md` first.

Start the file with this exact header:

> **SESSION HANDSHAKE — resume file.** You are a fresh AI session with no memory of prior
> work on this project. This file is your complete briefing. Read it fully, then confirm
> you are ready and state your intended first action before doing anything else.
> Rules: (1) Do not re-open decisions in "Decisions Made" — they are settled.
> (2) Do not touch anything in "Do Not Touch" unless the user explicitly asks.
> (3) Ground truth is the actual project state, not this document — if they disagree, the
> real state wins and you flag the discrepancy.

Then these exact sections in order: 1. Mission  2. Current State (working / half-built /
blocked / exact next action)  3. Decisions Made (choice · alternatives · reason ·
reversibility)  4. Architecture & Key Files  5. Gotchas & Hard-Won Knowledge  6. Conventions
In Play  7. Open Questions  8. Do Not Touch  9. Resume Command.

Be concrete, cut ruthlessly, no preamble. Test: reading only HANDOFF.md + the real repo, the
next session makes its next meaningful move within five minutes without re-asking settled things.
```

## Resume in the next Codex session

> Read HANDOFF.md and confirm you're ready to continue.
