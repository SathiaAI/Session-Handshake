> **SESSION HANDSHAKE — resume file.** You are a fresh AI session with no memory of prior
> work on this project. This file is your complete briefing. Read it fully, then confirm
> you are ready and state your intended first action before doing anything else.
> Rules: (1) Do not re-open decisions in "Decisions Made" — they are settled.
> (2) Do not touch anything in "Do Not Touch" unless the user explicitly asks.
> (3) Ground truth is the actual project state (files, running system), not this document —
> if they disagree, the real state wins and you flag the discrepancy.

<!--
This is the OUTPUT skeleton. You normally don't fill this in by hand — the generator
(HANDSHAKE.md) writes it for you from the live session. Kept here so you can see the
target shape and, if you ever want, draft one manually. Delete these comments in the real file.
Naming: HANDOFF.md in the project root. Archiving an old one: HANDOFF-archive-YYYY-MM-DD-HHMM.md
-->

# HANDOFF — <project name>

_Generated: <YYYY-MM-DD HH:MM> · Session/client: <e.g. Claude Cowork> · By: <you>_

## 1. Mission
<2–3 sentences: what we're building/fixing and why it matters. Plain language.>

## 2. Current State
- **Working & verified:** <what's done and proven, with how it was verified + commit/ref if any>
- **Half-built:** <what's in progress and its exact state>
- **Broken / blocked:** <what's stuck and on what>
- **Next action:** <the single exact thing the fresh session should do first>

## 3. Decisions Made (and Why)
- **Decision:** <what we chose>
  - **Alternatives considered:** <what we rejected>
  - **Reason:** <why>
  - **Reversibility:** <load-bearing | easy to change>
- **Decision:** <…>

## 4. Architecture & Key Files
| File / module / artifact | What it does / why it exists | Status this session |
|---|---|---|
| <path> | <one line> | created / modified / untouched-on-purpose |

## 5. Gotchas & Hard-Won Knowledge
- <the footgun, and what to do instead>
- <the "oh, that's why" moment>

## 6. Conventions In Play
- **Naming / structure:** <patterns>
- **Commits / testing:** <style, or "no tests yet — prototyping">
- **Rules files:** <CLAUDE.md / AGENTS.md / .cursorrules / design-principles.md / memory>
- **Deliberately NOT doing:** <scope we're holding off on>

## 7. Open Questions
1. <clear question the next session should ask the user>
2. <…>

## 8. Do Not Touch
- <file/system/decision that is settled — and why leave it alone>

## 9. Resume Command
> Read HANDOFF.md. Then <specific next action>. Do not <specific thing to avoid>.
> Confirm before making changes outside <scope>.
