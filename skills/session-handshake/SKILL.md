---
name: session-handshake
description: Write a HANDOFF.md so a fresh session — on Claude or any other AI client — can resume this work with no loss of context. Use when the session is getting long or near its context limit, when the user says "handshake", "handoff", "wrap up the session", "save context", or before switching tasks or AI tools.
---

# Session Handshake

Produce a **portable context handoff** so a brand-new session — possibly a different model on a different tool (Cursor, Codex, Grok, Gemini, Muse, etc.) — can continue this work immediately. This is an engineering handoff, not a chat summary.

## Do this

1. **Inspect real state, not memory.** List the actual files/artifacts. If it's a git repo, run `git status` and `git log --oneline -20` and cite real commit hashes. If it isn't (design tool, no-code build, docs, deck), inspect the real artifacts. If memory and real state disagree, real state wins — flag it.
2. **Handle existing handoff.** If `HANDOFF.md` exists, read it, then archive it as `HANDOFF-archive-YYYY-MM-DD-HHMM.md` before writing the new one.
3. **Write `HANDOFF.md`** in the project root. If there's no project folder, output it in full for the user to save. It must stand alone — assume the next session has zero memory and may be a different client.
4. **Start the file with this exact header, verbatim:**

```
> **SESSION HANDSHAKE — resume file.** You are a fresh AI session with no memory of prior
> work on this project. This file is your complete briefing. Read it fully, then confirm
> you are ready and state your intended first action before doing anything else.
> Rules: (1) Do not re-open decisions in "Decisions Made" — they are settled.
> (2) Do not touch anything in "Do Not Touch" unless the user explicitly asks.
> (3) Ground truth is the actual project state (files, running system), not this document —
> if they disagree, the real state wins and you flag the discrepancy.
```

5. **Then these 9 sections, exact headings, in order** (skip one only if it truly doesn't apply — say so):
   1. **Mission** — 2–3 plain sentences: what we're building/fixing, why it matters.
   2. **Current State** — working & verified / half-built / broken-or-blocked / the exact next action. Be concrete ("verified at commit abc1234"), never vague ("auth works").
   3. **Decisions Made (and Why)** — per decision: what we chose · alternatives rejected · reason · reversibility (load-bearing or not). This is the highest-value section — it stops the next session re-litigating settled calls.
   4. **Architecture & Key Files** — one line each: what it does, why it exists, and whether it was created / modified / deliberately-left-alone this session.
   5. **Gotchas & Hard-Won Knowledge** — every dead end and footgun that cost time, so it isn't repeated.
   6. **Conventions In Play** — naming, structure, commit/test style, what we're deliberately NOT doing yet, and any rules files (CLAUDE.md / AGENTS.md / .cursorrules / memory).
   7. **Open Questions** — each phrased as a clear question the next session must ask the user.
   8. **Do Not Touch** — settled files/systems/decisions not to revisit unless the user asks.
   9. **Resume Command** — a short, copy-pasteable, client-neutral instruction to start the next session.

## Quality bar

Cut ruthlessly — every sentence earns its place. Be honest about uncertainty. No preamble. **The test:** reading only `HANDOFF.md` plus the real project, the next session makes its next meaningful move within five minutes without re-asking anything already settled.

## When done

Show the path (or full contents) and a one-paragraph summary so the user can sanity-check before clearing/closing.

## Optional — Claude memory sync

If memory tools are available, also fold the durable Section 3 decisions into the relevant `/areas/<project>.md` memory file, so context survives even if the file is lost. Never write secrets, credentials, or sensitive personal data into the handoff or memory.

## When to trigger

Run at logical boundaries, not mid-change: near the context limit, after a milestone, after a hard debugging session, before switching tasks, and — especially — before switching AI clients. Do **not** run mid-implementation with a half-written change; finish first.
