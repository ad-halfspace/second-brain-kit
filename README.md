# Second Brain kit

A Claude Code setup that turns a folder into a personal second brain: an assistant with its own operating rules, a linked knowledge base, a task system, and skills for daily orientation, ingesting meetings and docs, consolidating knowledge, and kicking off client projects.

Built on Andrej Karpathy's [LLM wiki pattern](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f), extended with an entity-first project structure (`clients/`, `projects/`, `personal/`) and a Halfspace project-kickstart workflow.

## Get started

1. Clone this repo somewhere you'll keep it (e.g. `~/brain`). Don't fork it into a shared place: once you use it, it fills up with your own notes.
2. Open the folder in Claude Code (desktop app Code tab, or `claude` in a terminal).
3. Say: **"Read FIRST_RUN.md and walk me through setup."**

After that, `docs/00-start-here.md` covers day-to-day use. You can also just ask the assistant how anything works; it reads `docs/` for you.

## What's in here

| Path | What |
|---|---|
| `CLAUDE.md` | Entry point Claude Code reads every session |
| `FIRST_RUN.md` | Setup steps the assistant walks you through |
| `.claude/constitution/` | How the assistant behaves: identity, learning, retrieval, tasks, writing, comms |
| `.claude/skills/` | Slash commands: `/morning-brief`, `/check`, `/ingest`, `/learn`, `/remsleep`, `/prep`, `/create-task`, `/handover`, `/resume-handover`, `/project-kickstart`, `/transcribe`, `/scribbles`, `/artifact-comments` |
| `.claude/templates/` | Page templates (person, project, meeting, task, hub) |
| `agent_brain/` | The durable brain: people, topic hubs, tasks, standards, playbooks |
| `clients/` `projects/` `personal/` | One folder per project (hub + notes + outputs + meetings) |
| `raw/` | Inbox for transcripts, docs, exports to ingest |
| `artifacts/` | Generated outputs (briefs, handovers, logs) |
| `notes/` | Living personal notes and lists |
| `workspace/task-board/` | Local task board UI over `agent_brain/tasks/` |
| `plugins/` | Optional: package the skills as a plugin for Customize → Skills |
| `docs/` | How it all works |

## Requirements

- Claude Code
- Python 3.10+ for the task board and transcription
- Optional: Obsidian (nicer graph and linking), ffmpeg + Whisper (`/transcribe`), macOS (Apple Notes capture, task-board menu-bar app)

## Not included

Slide and proposal workflows are separate skills (`halfspace-slides`, `halfspace-proposal-creation`), installed through Halfspace's skill catalog, not this repo.
