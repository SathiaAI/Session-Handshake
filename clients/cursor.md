# Install for Cursor

Cursor doesn't read `SKILL.md`. It reads **project rules** (`.cursor/rules/*.mdc`) or the legacy `.cursorrules` file. Drop one of these into your project and you can trigger the handshake by asking Cursor to "run the session handshake."

## Option A (recommended) — project rule

Create `.cursor/rules/session-handshake.mdc` in your project:

```mdc
---
description: Write a portable HANDOFF.md so a fresh session (any AI client) can resume this work.
alwaysApply: false
---

When I say "session handshake", "handoff", "wrap up the session", or "save context",
write a file named HANDOFF.md in the project root that lets a fresh session — possibly a
different AI on a different tool — continue with zero loss of context.

Inspect real state first: run `git status` and `git log --oneline -20` and cite real
commit hashes (if not a git repo, inspect the real artifacts). If a HANDOFF.md exists,
archive it as HANDOFF-archive-YYYY-MM-DD-HHMM.md first.

Start the file with this exact header:

> **SESSION HANDSHAKE — resume file.** You are a fresh AI session with no memory of prior
> work on this project. This file is your complete briefing. Read it fully, then confirm
> you are ready and state your intended first action before doing anything else.
> Rules: (1) Do not re-open decisions in "Decisions Made" — they are settled.
> (2) Do not touch anything in "Do Not Touch" unless the user explicitly asks.
> (3) Ground truth is the actual project state, not this document — if they disagree, the
> real state wins and you flag the discrepancy.

Then these exact sections, in order: 1. Mission  2. Current State (working / half-built /
blocked / exact next action)  3. Decisions Made (choice · alternatives · reason ·
reversibility)  4. Architecture & Key Files  5. Gotchas & Hard-Won Knowledge  6. Conventions
In Play  7. Open Questions  8. Do Not Touch  9. Resume Command.

Be concrete, cut ruthlessly, no preamble. Test: reading only HANDOFF.md + the real repo, the
next session makes its next meaningful move within five minutes without re-asking settled things.
```

## Option B — legacy single file

If you prefer the old style, paste the same body (minus the `---` frontmatter block) into a `.cursorrules` file at the project root.

## Resume in the next Cursor session

Open the new session and say:

> Read HANDOFF.md and confirm you're ready to continue.
