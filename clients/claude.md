# Install for Claude (Claude Code, Cowork, claude.ai)

This is the closest to true one-click, because Claude reads `SKILL.md`.

## Option A (recommended) — skills CLI

```bash
npx skills add SathiaAI/Session-Handshake
```

This pulls the skill in `skills/session-handshake/`. If the CLI can't locate it, use Option B.

## Option B — manual copy

Copy the skill folder into your Claude skills directory:

```bash
# clone once
git clone https://github.com/SathiaAI/Session-Handshake.git
# then copy the skill into your personal skills dir
cp -r Session-Handshake/skills/session-handshake ~/.claude/skills/
```

For **Cowork / claude.ai**, add it as a custom skill in the skills UI (paste the contents of
`skills/session-handshake/SKILL.md`).

## Trigger it

Just say:

> Run the session handshake.

or *"write a handoff"*, *"save context before I clear this"*. Claude auto-invokes the skill.

## Resume in the next session

> Read HANDOFF.md and confirm you're ready to continue.
