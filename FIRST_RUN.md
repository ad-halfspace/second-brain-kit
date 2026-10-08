# First-run setup

Instructions for the assistant. Walk the user through these steps one at a time, asking with AskUserQuestion where possible. Write answers straight into the files named. When a step is done, say so and move on. If the user says "continue setup", find the first step whose files still contain `<PLACEHOLDER>` values and resume there.

## 1. Name and personality → `.claude/constitution/identity.md`

- What should the assistant be called? Replace `<ASSISTANT_NAME>` (also in `communications.md`).
- Personality archetype: offer *crisp minimalist* (terse, just answers), *warm collaborator*, *sparring partner* (challenges a lot), or their own words. Replace `<ARCHETYPE>` and adjust the bullets under **Personality** to match.
- Their name: replace every `<YOUR_NAME>` across `.claude/` (grep for it).

## 2. Goal and lenses → `identity.md` + `agent_brain/about_user/profile.md`

- Role, team, what they're working on now (clients, internal projects, personal projects).
- The one goal this system should serve this year → `<CURRENT_GOAL>`.
- 3 recurring lenses for checking work and decisions (offer the examples in the file) → `<LENS_1..3>`.
- Any privacy red lines (things never to store).
- Fill in `profile.md`.

## 3. Projects → `clients/`, `projects/`, `personal/`

- For each active client: create `clients/<slug>/<slug>.md` by copying `clients/example-client/`. For a new Halfspace engagement, `/project-kickstart` does this plus the full kickoff plan.
- Same for internal projects (`projects/`) and personal ones (`personal/`) they want tracked.
- Add the ones they want daily mind-share on to `agent_brain/about_user/project-pulse-rotation.md`.
- Delete `clients/example-client/` once a real client exists.

## 4. Tools → `.claude/constitution/config.yaml`

Ask which they use, then help connect each (claude.ai connector settings or `/mcp`):

- Outlook calendar + email (Microsoft 365 connector)
- Slack
- Notion (needed for `/project-kickstart`'s Notion step)
- A personal calendar (optional)
- Apple Notes "Scribbles" quick-capture (macOS only) → set `scribbles_inbox: true`
- Newsletters / RSS → list them in `agent_brain/about_user/feeds.md`, set `feeds: true`

## 5. Rituals → `config.yaml`

Explain the morning-brief rituals and let them pick: `project_pulse`, `milestones` (then add birthdays to `agent_brain/about_user/milestones.md`), `tracked_people_pulse`, `weekly_review`. Keep it minimal; they can add more later.

## 6. Optional extras

- **Skills in Customize → Skills**: run `bash plugins/sync-skills.sh`, then `claude plugin marketplace add ./plugins` and `claude plugin install second-brain@second-brain-local`.
- **Task board**: `python3 workspace/task-board/server.py`, then open http://localhost:3737. It reads `agent_brain/tasks/`.
- **Obsidian**: open the folder as a vault; see `agent_brain/understanding/standards/obsidian-config.md`.

## 7. Wrap up

Suggest a first real action: drop a meeting transcript or doc into `raw/` and say "ingest this", or run `/morning-brief`. Keep this file for reruns.
