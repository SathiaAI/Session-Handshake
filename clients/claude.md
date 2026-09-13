# Install for Claude

Claude has two surfaces and they install **differently**. Pick the one you use.

## A. Claude Code (local, on your machine) — one command

```bash
npx skills add SathiaAI/Session-Handshake
```

Pulls the skill from `skills/session-handshake/`. If the CLI can't locate it, clone and copy:

```bash
git clone https://github.com/SathiaAI/Session-Handshake.git
cp -r Session-Handshake/skills/session-handshake ~/.claude/skills/
```

## B. Cowork & claude.ai (cloud sessions) — upload once

**Important:** `npx skills add` does **not** reach Cowork — it installs to local filesystems
only. Cowork cloud sessions read from your **claude.ai account skill library**, so upload the
skill there once and every cloud session (and claude.ai chat) picks it up automatically.

1. Download **`dist/session-handshake.zip`** from this repo — it's pre-packaged with the
   `session-handshake/` folder as the zip's **root** (not nested), which is what claude.ai
   requires. (Or zip the `skills/session-handshake/` folder yourself, same rule.)
2. In claude.ai, go to **Customize → Skills → Add** and upload the zip.
3. It now auto-loads in every Cowork session. No per-session setup.

## Trigger it (either surface)

> Run the session handshake.

or *"write a handoff"*, *"save context before I clear this"*. Claude auto-invokes the skill.

## Resume in the next session

> Read HANDOFF.md and confirm you're ready to continue.
