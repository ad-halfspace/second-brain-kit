# Task Board

A local task board for the second brain. It reads/writes the task markdown files
in `agent_brain/tasks/` and renders them as an interactive board — list & kanban
views, grouping (due date / criticality / status / area / priority), a detail
drawer that resolves brain wiki-links, and a macOS menu-bar + floating-window app.

## Layout

```
task-board/
├── server.py        # local HTTP server + JSON API over the brain's task files
├── index.html       # the board UI (single file: HTML + CSS + JS)
├── fonts/           # Britti Sans web fonts
├── tasks_app.py     # macOS menu-bar popover + floating window (pyobjc/WebKit)
├── setup.py         # py2app config to build Tasks.app
└── "Task Board.command"  # double-click launcher
```

It expects to live at `<brain>/workspace/task-board/` — `server.py` resolves the
brain root as three levels up (`Path(__file__).resolve().parents[2]`).

## Run

Web only (any browser):
```
python3 server.py        # then open http://localhost:3737
```

Menu-bar / floating-window app (macOS, needs the framework Python with pyobjc):
```
/Library/Frameworks/Python.framework/Versions/3.14/bin/python3 setup.py py2app -A
open dist/Tasks.app
```
or just double-click **Task Board.command**.

### Dependencies (app only)
```
pip install pyobjc-core pyobjc-framework-Cocoa pyobjc-framework-WebKit py2app
```

## API (server.py)

- `GET  /api/tasks` — all tasks (status, priority, due, area, project, depends_on…)
- `GET  /api/projects` — project hubs from `agent_brain/projects/`
- `GET  /api/task/<slug>/detail` — rendered notes + resolved brain links
- `GET  /api/doc?target=<wikilink>` — render any linked brain doc
- `POST /api/task/new` · `PUT /api/task/<slug>` · `DELETE /api/task/<slug>`
- `POST /api/task/<slug>/toggle` — done ⇄ open
- `POST /api/open` — open a linked file in Obsidian / its native app
- `POST /api/projects` — create a new project hub

## Criticality

`criticality = priorityWeight + dueWeight` → Critical (≥5) / Elevated (≥3) / Normal.
Priority: P1=3 P2=2 P3=1. Due: overdue/today/tomorrow=3, ≤3d=2, ≤7d=1, else 0.
