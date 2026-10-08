---
type: standard
summary: "Entity-first vault structure: every project lives in one folder at the vault root (clients/ · projects/ · personal/), gathering its notes, outputs, and meetings; tasks and people stay central. "
state: canonical
updated: 2026-08-23
tags: [standard, structure, reorg]
---

# Entity-First Structure Standard

## Principle

Group knowledge by **the entity the work is about**, not by artifact type. Everything about one project sits under a single folder at the vault root, so you never chase a project across four subfolders (`references/`, `projects/`, `artifacts/`, `workspace/`) again.

This replaces the old **type-dispersed** model where a single engagement was scattered as a hub in `references/`, notes in `agent_brain/projects/`, outputs in `artifacts/`, and assets in `workspace/`.

## The three top-level homes

| Folder | Holds | Examples |
|---|---|---|
| `clients/<name>/` | External paid engagements | acme-shipping, nordic-bank |
| `projects/<name>/` | Internal Halfspace initiatives | ai-dd-playbook, social-committee |
| `personal/<name>/` | Personal-life projects | half-marathon, language-learning |

## Per-entity layout

```
<home>/<entity>/
  <entity>.md          # front-door hub (was references/<entity>.md or the project note)
  <engagement>/        # clients only, when there are multiple engagements
    notes/             # status, decisions, working notes
    outputs/           # finished deliverables (was artifacts/<entity>/)
  meetings/            # meeting notes for this entity (was artifacts/meetings/ or scattered)
```

For a single-engagement or simple project the engagement layer collapses — notes/outputs/meetings sit directly under `<home>/<entity>/`.

## What stays central (does NOT move)

- **Tasks** → `agent_brain/tasks/`. The task board scans this one folder; tasks carry a `project:` field and link from the entity hub. (See [[../../../.claude/constitution/knowledgebase|knowledgebase]] and the task-board memory.)
- **People** → `agent_brain/people/`. One person can touch many entities; central + tagged, linked from each hub.
- **Live code repos** → `workspace/`. Each keeps its own `.git`; the entity hub cross-links it. Code does not move under the entity; static decks and documents do.
- **Reusable synthesis** → `agent_brain/understanding/` (playbooks, patterns, standards, decisions).
- **Genuine topic hubs that are not projects** → `agent_brain/references/` (e.g. a hub for a methodology or a technology area that spans many projects).

## Front-door convention

Every entity hub opens with a `> [!info]+ Where everything lives` callout listing where notes / outputs / meetings / assets / central tasks + people are, so the folder is self-navigating. Copy the pattern from [[../../../clients/example-client/example-client|clients/example-client/example-client.md]].

## Migration discipline (when moving an entity)

1. Snapshot first (git), mirroring the Phase-1 "Pre-restructure snapshot".
2. `git mv` to preserve history.
3. Recompute relative wikilinks in moved files **and** inbound links from unmoved files; target **0 new broken links**.
4. Add the front-door callout to the hub.
5. Update [[../../_index|_index]] and the constitution if the top-level shape changed.
