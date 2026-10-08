# Learning Aggressiveness — Soft Settings

How eager the assistant should be about (a) ingesting new knowledge into the brain and (b) learning the user's patterns. Generated from the setup interview; edit any time.

## Two global knobs

### Ingestion aggressiveness — Auto

How eager to be about adding new things to the brain when durable signal surfaces in conversation, meetings, or sources.

**Current setting: Auto.** Capture every durable insight. Promote freely from `/learn` output. Mid-conversation auto-ingest fires without asking when the substance threshold is crossed (see "auto-ingest paths" below). Report what landed — don't ask for permission per item.

- **Auto** ← current setting.
- **Ask** — Capture clear-signal items autonomously; for judgment calls, propose and wait for a yes.
- **Off** — Don't auto-capture. Only write to the brain when she explicitly says "remember this" / "add to brain".

### Self-learning aggressiveness — Auto

How eager to be about observing and codifying the user's own patterns — writing style, decision shape, communication voice, code style, etc. Different from ingestion: this is about learning *how she works*, not capturing *what she's working on*.

**Current setting: Auto.** Observe + write to brain/memory + report what landed.

- **Auto** ← current setting.
- **Ask** — Observe + propose + she approves before writing.
- **Off** — Don't observe patterns; only act when explicitly told.

The asymmetry (Ask for ingestion, Auto for self-learning) is deliberate: the user wants to control what enters the brain about specific projects/people/decisions, but is happy for the assistant to compound a model of *her* fast.

## Per-domain overrides (advanced)

The two globals apply unless a per-domain override is set below. Use overrides when you're protective about a specific area.

```yaml
# Uncomment + edit any line to override the global self-learning setting for that domain.
# Each value is one of: auto | ask | off

# code_style: ask
# comms_style: ask
# decision_style: auto
# people_patterns: ask
# process_patterns: auto
# tooling_preferences: auto
```

If a line is commented out, the global setting applies.

## What each domain means

- **code_style** — naming, formatting, design patterns, comment density, test discipline. Captured in `agent_brain/understanding/standards/code-style.md` (created on first observation).
- **comms_style** — voice, register, hedging, signature phrases, channel-specific tone. Captured in `agent_brain/about_user/voice.md` or per-channel pages.
- **decision_style** — how the user weighs tradeoffs, decision frameworks she reaches for, what triggers a re-decide. Captured in `agent_brain/understanding/patterns/decision-shape.md`.
- **people_patterns** — preferred meeting cadence, communication norms with specific people, what to surface in `/prep`. Captured per-person.
- **process_patterns** — repeatable procedures she articulates while working. Captured in `agent_brain/understanding/playbooks/`.
- **tooling_preferences** — keyboard, editor, terminal, CLI tool preferences. Captured in `agent_brain/about_user/tooling.md`.

## How skills read these settings

- **`/learn`** — for each preservation candidate, gate-check ingestion-aggressiveness. `auto` = save freely (and note that most material was likely already captured mid-conversation); `ask` = propose; `off` = skip unless explicitly named.
- **`/remsleep` Phase 3 (synthesis)** — for new pattern detection, gate-check self-learning-aggressiveness. Per-domain overrides take precedence.
- **`/ingest`** — gate-check ingestion-aggressiveness for the "extract durable knowledge" step. Applies to whichever template the source classifies into (meeting, article, journal, export, etc.).
- **`/morning-brief` feeds phase** — gate-checks ingestion-aggressiveness for the auto-ingest pass. With an `Ask` setting, items only stage to `raw/feeds/` and the `auto_ingest` field on each feed is ignored. Flip to `Auto` later if/when feed quality is high enough to trust auto-ingest.
- **Web research auto-ingest** — after a WebSearch/WebFetch session whose synthesis crosses the substance threshold, the assistant proposes the ingestion plan first (because Ask), then waits for approval before running the full ingestion path.
- **In-conversation learning auto-ingest** — when the user states a durable fact mid-conversation (person joining a project, decision rationale, deadline, opinion worth citing), the assistant surfaces the candidate inline ("worth saving to X?") and writes on confirmation. Conflicts: when a new fact contradicts an existing brain page, **do not overwrite** — add the new fact alongside the old with a `> Conflict noted YYYY-MM-DD: ...` line for `/remsleep` to resolve.
- **Mid-conversation observation** — when the assistant notices a pattern about the user's own working style (style, decision, preference), capture it freely under the Auto self-learning setting. Durable facts about her own working style go to auto-memory (`~/.claude/projects/.../memory/`), not the brain — the two systems stay separate.

## Tunables

These knobs shape the auto-ingest behaviour. Edit any time:

```yaml
auto_ingest_research_min_words: 200    # synthesis below this word count is treated as a quick lookup, no ingestion
auto_ingest_research_min_sources: 3    # research with fewer distinct sources is treated as a single-source check
```

A research session qualifies when **either** threshold is met (OR, not AND). Cumulative web research targeting the same hub within a single conversation rolls up into one ingestion rather than firing per WebSearch call.

## Changing your mind

These are soft settings. Edit at any time. The skills read this file fresh each invocation.
