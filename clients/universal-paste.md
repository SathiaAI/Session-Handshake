# Universal paste — Grok, Grokbot, Gemini, Facebook Muse, or any AI

These clients have no "rules file" or "skill" concept. That's fine — the handshake was
designed to survive as **a plain prompt you paste**. Two ways to use it:

- **One-off:** paste the prompt below into the session when context gets heavy.
- **Reusable:** save it as a custom instruction / saved prompt / "Gem" / persona in that
  client so you can trigger it by name later.

## The paste prompt

Copy everything in the block and paste it into the session:

```
Write me a SESSION HANDSHAKE: a file named HANDOFF.md that lets a brand-new AI session —
possibly a different model on a different tool — pick up exactly where we are now, with no
loss of context, no re-litigating decisions we already made, and no repeating mistakes. This
is an engineering handoff, not a chat summary. Assume the next session has zero memory of this
conversation.

First, base it on real state, not your memory of what we said. If there's a repo, use its real
files and commit history. If not, use the actual artifacts we've produced.

Start the file with this exact header:

> **SESSION HANDSHAKE — resume file.** You are a fresh AI session with no memory of prior
> work on this project. This file is your complete briefing. Read it fully, then confirm
> you are ready and state your intended first action before doing anything else.
> Rules: (1) Do not re-open decisions in "Decisions Made" — they are settled.
> (2) Do not touch anything in "Do Not Touch" unless the user explicitly asks.
> (3) Ground truth is the actual project state, not this document — if they disagree, the
> real state wins and you flag the discrepancy.

Then write these exact sections, in this order:
1. Mission — 2-3 plain sentences: what we're building/fixing and why.
2. Current State — what's working & verified, what's half-built, what's blocked, and the exact
   next action.
3. Decisions Made (and Why) — per decision: what we chose, alternatives rejected, the reason,
   and whether it's load-bearing or easy to change.
4. Architecture & Key Files — one line each: what it does, why it exists, and whether it was
   created / changed / deliberately left alone.
5. Gotchas & Hard-Won Knowledge — every dead end and footgun that cost time.
6. Conventions In Play — naming, structure, commit/test style, and what we're deliberately not
   doing yet.
7. Open Questions — each as a clear question for the user.
8. Do Not Touch — settled things not to revisit unless I ask.
9. Resume Command — a short, copy-pasteable instruction to start the next session.

Be concrete, cut ruthlessly, no preamble. Then show me the full file so I can sanity-check it.
The bar: reading only HANDOFF.md plus the real project, the next session should make its next
meaningful move within five minutes without asking me anything we already settled.
```

## Resume in the next session

Paste the generated `HANDOFF.md` in, or attach the file, and say:

> Read this HANDOFF and confirm you're ready to continue.
