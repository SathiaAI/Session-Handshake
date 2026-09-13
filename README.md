# 🤝 Session Handshake

**Long AI session hitting the wall? Hand it off cleanly — to a fresh session, on *any* client.**

When your context window gets heavy, you shouldn't have to start over. Session Handshake
generates a single `HANDOFF.md` — an engineering-grade briefing (not a chat summary) that a
brand-new session reads and instantly continues from. Works whether the next session is
**Claude, Cursor, Codex, Grok, Grokbot, Gemini, Facebook Muse**, or anything else.

> Old session writes the handoff → you clear/close it → new session reads it → you're back to
> full speed in under five minutes, with no decisions re-litigated and no mistakes repeated.

---

## The one honest thing up front

A "skill" (`SKILL.md`) is a **Claude-only** format. Cursor, Codex, Grok, Gemini and Muse don't
read it — so there's no single file that magically installs everywhere. **But the output is
universal:** a `HANDOFF.md` is plain markdown that every AI can read. So this repo ships **one
brain** (the generator prompt) with **thin per-client triggers**. One prompt, many light switches.

| Client | How to install | One-click-ish? |
|---|---|---|
| **Claude** (Code / Cowork / claude.ai) | `npx skills add SathiaAI/Session-Handshake` — see [`clients/claude.md`](clients/claude.md) | ✅ Yes — real skill |
| **Cursor** | Drop a rule into `.cursor/rules/` — see [`clients/cursor.md`](clients/cursor.md) | ⚡ Copy one file |
| **Codex** (& AGENTS.md tools) | Add a section to `AGENTS.md` — see [`clients/codex-agents.md`](clients/codex-agents.md) | ⚡ Copy one section |
| **Grok / Grokbot / Gemini / Muse / any** | Paste a prompt — see [`clients/universal-paste.md`](clients/universal-paste.md) | 📋 Paste (or save as a custom prompt) |

> **⚠️ Cowork / claude.ai (cloud) works differently from Claude Code.** `npx skills add`
> installs to *local* agents only — it does **not** reach Cowork cloud sessions. For those,
> upload [`dist/session-handshake.zip`](dist/session-handshake.zip) once via **Customize →
> Skills** in claude.ai; it then auto-loads in every session. Full steps in
> [`clients/claude.md`](clients/claude.md).

---

## Quick start

**1. Install for your client** (table above). The fastest path for Claude:

```bash
npx skills add SathiaAI/Session-Handshake
```

**2. When context gets heavy, trigger it:**

> Run the session handshake.

(or *"write a handoff"*, *"save context before I clear this"*.) On clients without skills/rules,
paste the prompt from [`clients/universal-paste.md`](clients/universal-paste.md).

**3. Clear or close the old session. Open a new one and say:**

> Read HANDOFF.md and confirm you're ready to continue.

That's the handshake. Done.

---

## What's in the box

```
Session-Handshake/
├── HANDSHAKE.md                     # 🧠 the universal generator prompt (paste-anywhere core)
├── templates/HANDOFF.template.md    # the 9-section output skeleton it produces
├── skills/session-handshake/
│   └── SKILL.md                     # Claude / Cowork / Claude Code auto-load
├── clients/
│   ├── claude.md                    # install for Claude
│   ├── cursor.md                    # .cursor/rules snippet
│   ├── codex-agents.md              # AGENTS.md snippet
│   └── universal-paste.md           # Grok / Gemini / Muse / any — paste prompt
├── install.sh                       # optional convenience installer
└── LICENSE                          # MIT
```

## What the handoff actually contains

Nine sections, engineered so the next session doesn't waste your time:

1. **Mission** — what we're building/fixing and why (plain English).
2. **Current State** — working / half-built / blocked + the exact next action.
3. **Decisions Made (and Why)** — choice · alternatives · reason · reversibility. *The single
   biggest win over auto-compaction* — the next session won't re-open settled calls.
4. **Architecture & Key Files** — what exists and why, and what was left alone on purpose.
5. **Gotchas & Hard-Won Knowledge** — the footguns, so they aren't stepped on twice.
6. **Conventions In Play** — how we work, and what we're deliberately *not* doing yet.
7. **Open Questions** — clear questions for you, not vague topics.
8. **Do Not Touch** — settled things the next session shouldn't "helpfully" refactor.
9. **Resume Command** — copy-paste to start the next session instantly.

Every generated file opens with a **portability header** that tells the receiving session — on
any tool — exactly how to behave: read fully, confirm readiness, don't re-litigate, and trust
the real project state over the document if they ever disagree.

## Why not just use `/compact` or auto-summarization?

| | Auto-compact / summary | Session Handshake |
|---|---|---|
| Fires when | At an arbitrary point (often mid-task) | You choose — at a logical boundary |
| Keeps *why* behind decisions | Rarely | Yes — a whole section for it |
| Portable to another AI client | No | Yes — plain markdown + portability header |
| Grounded in real file/repo state | No | Yes — inspects real state, cites commits |
| Survives closing the session | No | Yes — it's a file on disk |

See [`HANDSHAKE.md` → Appendix A](HANDSHAKE.md) for *when* to run one.

## Credits

Built by [SathiaAI](https://github.com/SathiaAI). Distills the best of Claude's
`strategic-compact` (when to compact), `import-memory` (cross-assistant portability), and a
battle-tested handoff prompt. MIT licensed — fork it, ship it, make it yours.
