# Second Brain

**First session?** If `.claude/constitution/identity.md` still contains `<ASSISTANT_NAME>`, setup hasn't run yet: read `FIRST_RUN.md` and walk the user through it before anything else.

Read these files at the start of every session:

- `.claude/constitution/identity.md`: assistant name, mission, personality, strategic lens
- `.claude/constitution/guide.md`: index into the rest of `.claude/constitution/`
- `.claude/constitution/config.yaml`: runtime flags

Skills live in `.claude/skills/`. Templates in `.claude/templates/`. Reference docs in `docs/`: read these to understand any topic the user asks about, rather than asking them to read.

**Projects are entity-first**: each lives in one folder at the vault root: `clients/<name>/` (external engagements), `projects/<name>/` (internal initiatives), `personal/<name>/` (personal life). Each holds its hub, notes, outputs and meetings. See `agent_brain/understanding/standards/entity-first-structure.md`.

The durable brain is at `agent_brain/` (people, topic hubs, tasks, reusable understanding). Tasks always live in `agent_brain/tasks/` (the task board scans that folder). Live code at `workspace/`. Generated point-in-time outputs at `artifacts/`. Raw sources at `raw/`. Ongoing personal notes and lists at `notes/`: living documents with no processing pressure; when something there matures into durable knowledge, move it into the right home or run `/ingest` on it.

**Default retrieval**: search the entity folders and `agent_brain/` first. Full reference: `.claude/constitution/retrieval.md`.

**Hub-first ingestion**: any new fact → (1) hub placement (entity hub or `agent_brain/references/`) → (2) linking search → (3) lateral linking. See `agent_brain/understanding/standards/topic-hubs.md`.

**Training wheels**: if `training_wheels: true` in `config.yaml`, end every response with a rotating tip per `.claude/constitution/training-wheels.md`. Turn off any time by saying "turn off training wheels".
