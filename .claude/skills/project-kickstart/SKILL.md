---
name: project-kickstart
description: "Kickstart a new Halfspace client project — validate hats, create brain hub, set up Notion page, generate dated action plan, and output a bookable meeting schedule."
---

# /project-kickstart — New Client Project Setup

> Executes the Halfspace Project Excellence Start Phase for a new engagement.
> Outputs a dated action plan + meeting list ready to book, a brain project hub, and a Notion project page.

## Arguments

- `/project-kickstart` — interactive, asks for all inputs
- `/project-kickstart [client-name]` — skips client name question
- `/project-kickstart [client-name] [YYYY-MM-DD]` — also sets start date

---

## Step 1: Gather project info

If not already in arguments, ask the user for:

1. **Client name** (short slug for filenames, e.g. "maersk" or "novo-nordisk")
2. **Project name / codename** (short descriptive name)
3. **Project start date** (first day of active delivery — default to next Monday from today if not provided)
4. **Is this a new client?** (yes → the Notion admin must set up the client Notion space; no → space already exists)
5. **Team composition** — for each person, their name and which hat(s) they hold:
   - 🧭 Project Lead
   - 🔧 Tech Lead
   - 🧪 Solution Lead
   - 💼 Commercial Lead
   - 🧑‍💼 Client Lead
6. **Known client stakeholders** (names + roles, optional — can be empty for now)

Ask for inputs 1–5 together in a single prompt. Do not ask for them one at a time.

---

## Step 2: Validate hat coverage

Check that all 5 hats are assigned. If any are missing:
- Flag them clearly: "⚠️ Missing hats: [list]. Align with the Partner before kickoff."
- Do NOT block the rest of the skill — continue with what's known.

---

## Step 3: Read the PE playbook

Read `agent_brain/understanding/playbooks/project-kickstart.md` for the full framework, checklists, and template links.

---

## Step 4: Build the brain project hub

Projects are entity-first (see `agent_brain/understanding/standards/entity-first-structure.md`). For a client engagement, create under `clients/`:

Create file: `clients/{client-slug}/{project-slug}/notes/{client-slug}-{project-slug}.md` (and a `clients/{client-slug}/{client-slug}.md` client hub with a "Where everything lives" front-door callout if one doesn't exist yet).

If the `clients/{client-slug}/` directory doesn't exist, create it. Keep tasks in `agent_brain/tasks/` and people in `agent_brain/people/` (central, linked from the hub).

Use this frontmatter and structure:

```markdown
---
name: {project-name}
client: {client-name}
type: project
status: start_phase
start_date: {YYYY-MM-DD}
team:
  project_lead: {name or TBD}
  tech_lead: {name or TBD}
  solution_lead: {name or TBD}
  commercial_lead: {name or TBD}
  client_lead: {name or TBD}
notion_project_page: TBD
updated: {today}
tags: [project, halfspace, {client-slug}]
---

# {Project Name} — {Client Name}

**Status**: Start Phase
**Start date**: {YYYY-MM-DD}
**Client**: {client-name}

## Team

| Hat | Person |
|-----|--------|
| 🧭 Project Lead | {name} |
| 🔧 Tech Lead | {name} |
| 🧪 Solution Lead | {name} |
| 💼 Commercial Lead | {name} |
| 🧑‍💼 Client Lead | {name} |

## Stakeholders

{list if provided, otherwise "To be mapped in Week 1"}

## Open questions

- [ ] {any open questions from the conversation}

## Notes

_Project hub created {today} via /project-kickstart_
```

---

## Step 5: Set up Notion project page

**If the user has confirmed the Notion admin has set up the client space (or this is an existing client):**

Attempt to duplicate the Notion project template into the client's Notion space:
- Template page ID: `31a1049b7e6680b4841be47f4b7712f5`
- Use `notion-duplicate-page` or `notion-create-pages` as available
- Set the title to: `{Client Name} — {Project Name}`
- After creation, update the brain hub file with the `notion_project_page` URL

**If this is a new client and the Notion admin hasn't set up the space yet:**
- Note in output: "Notion setup blocked — ping the Notion admin to create the client space first, then run this step manually."

---

## Step 6: Generate the Start Phase action plan

Based on `start_date`, generate a concrete week-by-week plan. Use ISO dates.

**Format:**

```
## Start Phase — Action Plan
Client: {client-name} | Project: {project-name} | Start: {YYYY-MM-DD}

### Week 1 ({Mon}–{Fri})
- [ ] {YYYY-MM-DD} Brief Partner meeting — align on scope, contracts, risks (PII, NDA, SoW)  [Project Lead + Commercial Lead]
- [ ] {YYYY-MM-DD} Compliance check — complete CDP tool questions  [Project Lead]
- [ ] {YYYY-MM-DD} AI Act risk classification (if AI in EU)  [Project Lead]
- [ ] {YYYY-MM-DD} Set up project in CDP tool + RORO  [Project Lead]
- [ ] {YYYY-MM-DD} Client Notion space confirmed with Notion admin  [Project Lead]
- [ ] {YYYY-MM-DD} Create Notion project page from template  [Project Lead]
- [ ] {YYYY-MM-DD} Set up DevOps board  [Tech Lead]
- [ ] {YYYY-MM-DD} Provision all system accesses  [Tech Lead]
- [ ] {YYYY-MM-DD} Request Teams recording access (2–3 people, ask KNN)  [Project Lead]
- [ ] {YYYY-MM-DD} Research client business + map initial stakeholders  [Project Lead + Client Lead]
- [ ] {YYYY-MM-DD} Book internal Team Kickoff (60 min) for Week 2  [Project Lead]
- [ ] {YYYY-MM-DD} Book Client Kickoff for Week 2  [Project Lead]
- [ ] {YYYY-MM-DD} Book all recurring internal meetings (see cadences below)  [Project Lead]

### Week 2 ({Mon}–{Fri})
- [ ] {YYYY-MM-DD} 🎯 Internal Team Kickoff (60 min) — roles, context, stakeholders, setup  [All]
  → Use: Team Kick off.pptx (see PE templates)
- [ ] {YYYY-MM-DD} 🎯 Client Kickoff — problem, scope, responsibilities, expectations  [Project Lead + Client Lead]
  → Use: agenda from Project Excellence Template.pptx
```

Include actual ISO dates (not just "Week 1"). Day 1 = start_date (or the next Monday if start_date is a weekend).

**Heuristics:**
- Partner alignment meeting: start_date + 0 days (Day 1)
- Internal kickoff: start_date + 5–7 days (first full week done, second week starts)
- Client kickoff: start_date + 7–10 days

---

## Step 7: Output meeting cadences to book

Print a table of all recurring meetings to add to the calendar:

```
## Recurring meetings to book (starting {Week 2 Monday})

| Meeting | Day/Freq | Duration | Who |
|---------|----------|----------|-----|
| Daily Standup | Daily | 15 min | Full team |
| Weekly Planning | Monday | 60 min | Full team |
| Problem Solving Session | Weekly | 60 min | Full team + invited experts |
| Client Standup | Weekly or bi-weekly | 30 min | Project Lead + Client Lead + client |
| Team Temperature (PIE) | Weekly (add to standup) | +10 min | Full team |
| Client Review | Monthly / milestone | 60–90 min | Project Lead + relevant team |
| SteerCo (if applicable) | Monthly / milestone | 60 min | Project Lead + Client Lead + exec |
| 1:1 People Growth (mid-project) | Mid-project once | 30 min/person | Project Lead + each team member |
```

---

## Step 8: Save artifact

Save the full output to `artifacts/briefs/{YYYY-MM-DD}-{client-slug}-kickstart.md`.

Include: hat check, action plan, meeting cadences, and link to brain hub file.

---

## Step 9: Print summary

Output to the user:

```
## /project-kickstart complete

**Client**: {client-name}
**Project**: {project-name}
**Start date**: {YYYY-MM-DD}

**Hat check**: ✅ all 5 assigned  /  ⚠️ missing: [list]

**Created**:
- Brain hub: clients/{client-slug}/{project-slug}/notes/{filename}.md
- Notion page: {URL or "pending Notion admin"}
- Artifact: artifacts/briefs/{filename}.md

**Next actions (top 3)**:
1. {most urgent item from action plan}
2. {second most urgent}
3. {book the internal kickoff}
```

Keep the summary tight. The full plan is in the artifact.
