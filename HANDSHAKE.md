# The Session Handshake — Universal Generator

> **What this is:** The one prompt that writes the handoff. It is client-neutral: it
> works when pasted into Claude, Cursor, Codex, Grok, Grokbot, Gemini, Facebook Muse, or
> any other AI coding/agent session. In Claude/Cowork/Claude Code it also auto-loads as a
> skill (see `skills/session-handshake/`), so you can just say *"do a handshake"*.
>
> **How to trigger it:**
> - **Any client:** paste everything below the line into your session when context is getting heavy.
> - **Claude:** say *"run the session handshake"* or *"write a handoff"*.
>
> It produces a single file — `HANDOFF.md` — that a brand-new session, on any client, can
> read and instantly continue from. Then you clear/close the old session and open the new
> one with: *"Read HANDOFF.md and confirm you're ready to continue."*

---

# Create a Session Handshake (Context Handoff Document)

We're approaching the limits of useful context in this session. Before I clear or close it, write a handoff document that lets a **fresh session — possibly on a different AI client** — pick up exactly where we left off, with no loss of momentum, no re-litigation of decisions we already made, and no repeated mistakes.

This is **not** a conversation summary. It's an engineering handoff. Write it the way a senior engineer briefs their replacement on day one: focused on what matters for shipping, not what was said.

## Output

Create a file named `HANDOFF.md` in the project root (or, if there is no project folder, output it in full so I can save it myself).

If a `HANDOFF.md` already exists, read it first, then archive it as `HANDOFF-archive-YYYY-MM-DD-HHMM.md` before writing the new one.

The new file must stand entirely on its own. Assume the next session has **zero memory** of this conversation and **may be a different model on a different tool** — so never rely on anything that lives only in this client's memory, hidden state, or chat history.

Begin the file with this exact portability header, verbatim, so any client knows what it's holding:

```
> **SESSION HANDSHAKE — resume file.** You are a fresh AI session with no memory of prior
> work on this project. This file is your complete briefing. Read it fully, then confirm
> you are ready and state your intended first action before doing anything else.
> Rules: (1) Do not re-open decisions in "Decisions Made" — they are settled.
> (2) Do not touch anything in "Do Not Touch" unless the user explicitly asks.
> (3) Ground truth is the actual project state (files, running system), not this document —
> if they disagree, the real state wins and you flag the discrepancy.
```

## Required Sections

Use these exact headings, in this order. Skip a section only if it genuinely doesn't apply (say so briefly rather than omitting it).

### 1. Mission
Two or three sentences. What are we actually building or fixing, and why does it matter? Skip the corporate framing; write it like you'd describe it to another engineer over coffee.

### 2. Current State
Where things stand **right now**, in concrete terms:
- What's working and verified
- What's half-built, and in what state
- What's broken or blocked, and on what
- The exact next action a fresh session should take

Be specific. "Auth is working" is useless. "Sign-in works end-to-end; the session hook returns the expected shape; the protected route correctly rejects unauthenticated requests, verified manually at commit `abc1234`" is useful.

### 3. Decisions Made (and Why)
Every non-obvious technical or product decision made this session. Format each as:
- **Decision:** what we chose
- **Alternatives considered:** what we rejected
- **Reason:** why we chose it
- **Reversibility:** load-bearing, or easy to change later?

This is the single biggest win over a raw summary or auto-compaction. The next session will be tempted to re-debate these. Document them well enough that it doesn't have to.

### 4. Architecture & Key Files
A map of the relevant work. For each important file, module, or component, one line on what it does and why it exists. Call out:
- Files/artifacts we created this session
- Files we changed significantly (what changed conceptually, not line-by-line)
- Things that look like they should be touched but **shouldn't**, and why

### 5. Gotchas & Hard-Won Knowledge
The stuff that cost us time. Every dead end, every "oh, that's why" moment, every footgun. Examples of the *shape* to aim for:
- "The webhook signature check fails silently if the body is parsed before verification."
- "This framework caches aggressively; force a fresh fetch for the dashboard queries."
- "Security policies don't apply to the service-role key — learned that the hard way."

If a fresh session would repeat a mistake without this, write it down.

### 6. Conventions In Play
How we're working that isn't obvious from looking at the output: naming patterns, file organization, commit style, testing approach, and what we're deliberately **not** doing yet (e.g., "no unit tests — we're prototyping"). Reference any existing rules files (`CLAUDE.md`, `AGENTS.md`, `.cursorrules`, `design-principles.md`, memory, etc.).

### 7. Open Questions
Things we deferred, didn't decide, or need the user to weigh in on. Phrase each as a clear question, not a vague topic. The next session should know exactly what to ask before proceeding.

### 8. Do Not Touch
Files, systems, or decisions that are settled and should not be revisited unless the user explicitly asks. This stops the next session from "helpfully" refactoring something we deliberately left alone.

### 9. Resume Command
End the file with a short, copy-pasteable instruction the user can give the next session to get rolling immediately. Keep it client-neutral. Something like:

> "Read HANDOFF.md. Then [specific next action]. Do not [specific thing to avoid]. Confirm before making changes outside [scope]."

## Quality Bar

Before writing, do the work to make it actually useful:

1. **Re-read this session with fresh eyes.** What would a stranger — on a different tool — need to know?
2. **Inspect the actual project state, don't write from memory.** List the working files. If this is a git repo, run `git status` and `git log --oneline -20` and cite real commit hashes. If it isn't (a design tool, a no-code build, a doc set, a deck), inspect whatever the real artifacts are and describe their concrete state. If memory and the real state disagree, the real state wins and you note the discrepancy.
3. **Cut ruthlessly.** Every sentence earns its place. If removing it wouldn't hurt the next session, remove it.
4. **Be honest about uncertainty.** If you're not sure something works, say so. If we made a choice you have reservations about, note them in Decisions Made.
5. **No throat-clearing.** No "In this session we explored…" Get to the substance.

**The test:** if the next session reads only `HANDOFF.md` plus the actual project, it should make the next meaningful move within five minutes without asking the user anything that was already settled.

When the file is written, show me its path (or full contents) and a one-paragraph summary so I can sanity-check before I clear or close the session.

---

## Appendix A — When to run a handshake

Don't wait for the wall. Run it at logical boundaries, before context rot sets in:

| Moment | Handshake? | Why |
|---|---|---|
| Approaching context limit / replies getting vague | **Yes** | You're about to lose fidelity — capture it now |
| Finished a milestone, starting a new one | **Yes** | Clean slate for the next chunk |
| Switching to an unrelated task in the same session | **Yes** | Stops the old task's context from polluting the new one |
| After a nasty debugging session | **Yes** | Clear the dead-end reasoning before moving on |
| Mid-implementation, half a change written | **No** | You'd lose variable names, paths, partial state — finish first |
| Switching AI clients (e.g. Claude → Cursor) | **Yes** | This is the whole point — the handoff is the bridge |

## Appendix B — For Claude sessions only (optional)

If you're running in Claude/Cowork with memory tools available, in addition to writing `HANDOFF.md`, update the relevant `/areas/<project>.md` memory file with any durable decisions from Section 3 — so the context survives even if the file is lost. Do not put secrets, credentials, or sensitive personal data in either place.
