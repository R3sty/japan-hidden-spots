# Japan Hidden Spots: Team Playbook

The one reference for this project: what we're building, the roadmap, how we work, and how we use AI.
Live status lives on the GitHub Project board. This file holds the plan and the rules.

---

## 1. The project

**Japan Hidden Spots**: a web app where people share hidden tourist spots, family-owned restaurants and food stalls in Japan, and review them.

**MVP (must have, keep it this small):**
- Sign up / log in
- Add a spot: name, prefecture, category (restaurant, food stall, sightseeing, other), description
- Browse spots + filter by prefecture and category
- Spot page with reviews and a 1–5 star rating
- Edit/delete your own spots

**Data (3 tables):** users, spots, reviews (a user has many spots and reviews; a spot has many reviews)

**Later (only after the MVP is live):** search, photos, map, favorites, JP/EN toggle, TypeScript

**Stack (all free, mostly what you learned in Odin):** React + Vite (JavaScript), Tailwind CSS, Node + Express, PostgreSQL (Neon free tier), Supertest for a few API tests. Deploy: frontend on Vercel, API on Render free tier. GitHub Actions (CI) is already set up for you.

## Learning links (free)
Use these when an Issue needs something you haven't done yet. No need to study them all first.
- **React:** [react.dev/learn](https://react.dev/learn), the official tutorial
- **Express, PostgreSQL, auth, testing routes:** revisit the matching lessons in [The Odin Project: NodeJS course](https://www.theodinproject.com/paths/full-stack-javascript/courses/nodejs). You've done these already.
- **SQL practice:** [SQLBolt](https://sqlbolt.com), short interactive lessons
- **Tailwind CSS:** [Styling with utility classes](https://tailwindcss.com/docs/styling-with-utility-classes) (30 min), practise at [Tailwind Play](https://play.tailwindcss.com), setup with [Vite](https://tailwindcss.com/docs/installation/using-vite)
- **Free Postgres database:** [Neon docs](https://neon.com/docs/introduction)
- **Deploy (Sprint 5):** [Vercel docs](https://vercel.com/docs) for the frontend, [Render docs](https://render.com/docs) for the API
- **Stuck on a concept?** Ask Claude: "Explain [concept] simply, with a small example, then quiz me."

---

## 2. Team and roles

| Who | Role | Does |
|---|---|---|
| Resty | Tech lead / product owner | Writes Issues, reviews PRs and Friday updates |
| Resty | Developer #2 | Takes 1 small Issue per sprint using the AI-agent workflow |
| Ryan | Developer #1 | Builds most features, reviews Resty's PRs |

---

## 3. Roadmap

One sprint = 1 week. Target: live app with README by **Dec 20** (before the holidays).

**Where sprints are tracked:** on GitHub, not here. Each sprint is a **Milestone**, each task an **Issue**, and progress shows on the **Project board**. This section is the overview only; don't tick things off here.

Each sprint also has one **AI skill** to practise, so Ryan builds AI habits step by step, starting from zero.

### Sprint 0 · Nov 8–15 · Kickoff
- Repo, board, templates, CI set up (Resty/Claude)
- Ryan reads this playbook
- Readiness test: one Express route that saves + lists spots in a database, **no AI**, 1–2 hrs
- Wireframe the 4–5 screens (paper or Figma)
- Draft the data model (users, spots, reviews) as an Issue comment
- **AI skill: first contact.** Free Claude account. Paste code from the old React Todo app and try: "explain this line by line", "what would a senior dev change?", "ask me 3 questions to test me".

### Sprint 1 · Nov 16–22 · Skeleton + API
- App skeleton: Vite frontend + Express backend in one repo (Ryan, from scratch)
- Database connected, tables created
- CRUD API for spots, tested with Thunder Client
- **AI skill: AI as tutor.** Write the 3 lines (goal / tried / think) first, then ask Claude to explain, not fix. Share one good and one bad AI answer in your Friday update.

### Sprint 2 · Nov 23–29 · Frontend
- Spot list, spot page, add/edit spot form, calling the API
- Filter by prefecture and category
- Show "Loading..." and error messages
- Tailwind styling (learn it as you go)
- **AI skill: AI for planning and design.** Paste the plan into Claude: "what am I missing?". Ask Claude for a UI mockup from the wireframe, then build it yourself.

### Sprint 3 · Nov 30–Dec 6 · Auth
- Register / login the way you learned it in Odin (Passport + sessions, passwords hashed with bcrypt)
- Only logged-in users can add spots; users can edit/delete only their own ("My spots")
- **AI skill: AI as draft writer.** Claude may draft code. Ryan runs it and explains it in the Friday update or PR description. Ask "is this secure?" and check the answer.

### Sprint 4 · Dec 7–13 · Reviews + quality
- Reviews and star ratings on spot pages
- Basic input checks (e.g. name required, rating 1–5) with clear error messages
- 2–3 API tests with Supertest (like in Odin)
- **AI skill: AI as reviewer.** Paste your PR changes into Claude before asking for review: "review this like a senior developer". Optional: try GitHub Copilot Free agent mode in VS Code to help write the tests, then check every changed file.

### Sprint 5 · Dec 14–20 · Ship
- Deploy frontend + API
- README: what it is, screenshots/GIF, stack, how to run, decisions and problems solved
- 3 friends add real spots and try it; fix what they find
- Add to Ryan's CV and GitHub profile
- **AI skill: explain it without AI.** Mock interview with Resty, no AI open: walk through the app, the code, and where AI helped or was wrong.

**Rule:** nothing gets added to the roadmap unless something else is dropped. New ideas go to "Later" (section 7).

---

## 4. How we work (like a real team)

### Weekly rhythm (async, like remote teams)
- **Friday:** Ryan posts a 3-line update (done / next / blockers) + a screenshot
- **Weekend:** Resty reviews PRs and replies
- **Calls:** only when needed (stuck, big decision, or a demo)

### Board columns
Backlog → To do → In progress → In review → Done

### Issue format
```
As a [user], I want [thing] so that [reason].

Done when:
- [ ] ...
- [ ] ...
```

### Per Issue, step by step
1. Assign yourself, move the card to **In progress**
2. Make a branch: `git switch -c feat/12-add-application`
3. Small commits with clear messages: `feat: add application form`
4. Push, open a PR. Description includes `Closes #12` and "AI used for: ..."
5. CI must be green (lint + tests)
6. 1 approval from the other person, then merge (squash)
7. Delete the branch, card moves to **Done**

### Branch rules
- No pushing to `main` directly
- Every change goes through a PR with 1 approval

### Reviewing a PR (both of you)
- Does it do what the Issue says?
- Can the author explain it?
- Anything confusing, duplicated, or untested?
- Optional: paste the PR diff into Claude, "review this like a senior developer", then decide which comments are worth keeping
- Be kind and specific: "Could we move this to a helper? It's used twice."

---

## 5. How we use AI

AI is part of the job now. Use it like a good developer: fast, but you understand and own every line.

**The one rule: you must understand your code. If the lead points at any part of a PR, you can explain what it does and why, in your own words.**

### Tools (free)
- **Claude** (claude.ai, free account): chat for explanations, hints, reviews
- **GitHub Copilot Free** (VS Code): optional, from Sprint 4

### Phases
| Sprints | AI's role | You |
|---|---|---|
| 0–2 | Tutor (Sprint 2: also planning/design) | Write the code. AI explains errors and concepts, doesn't write the fix. |
| 3 | Draft writer | AI can draft code. You run it, read every line, change what you don't like. |
| 4–5 | Reviewer / helper | Describe the feature, the agent writes it, you review, test and fix. |

If the readiness test in Sprint 0 goes well, we can move to "Draft writer" sooner.

### Before you ask AI, write 3 lines
1. What I'm trying to do
2. What I tried
3. What I think is wrong

### Good prompts
- "Explain why this fails. Don't give me the fixed code."
- "Give me one hint, not the solution."
- "Here's my plan for this feature. What am I missing?"
- "Review this code like a senior developer. What would you change and why?"
- "Ask me 3 questions to check if I understand this."
- "Explain this code line by line in simple words."

### Avoid (Sprints 0–3)
- "Build me a job tracker app."
- "Fix this" + 300 lines with no context
- Copying an answer without reading it

### Never paste into AI
- Passwords, API keys, `.env` files, database URLs
- Other people's personal data

### Always check AI output
AI is often wrong in ways that look right. Run it, test it, and ask "why this way?" when something looks unfamiliar.

---

## 6. Ryan's interview checklist

By Dec 20 Ryan should be able to explain, without notes:
- [ ] How a request travels: browser → React → Express → DB → back
- [ ] Why these 3 tables and how they relate
- [ ] How login works and how the API knows who you are
- [ ] Props vs state; where state lives in his app and why
- [ ] What a PR review caught that he would have missed
- [ ] One bug that was hard and how he found it
- [ ] How he used AI and where it was wrong

---

## 7. Later (parked, review after Dec 20)
- Performance checklist (caching, CDN, code splitting, etc.)
- Photos, map, favorites, JP/EN toggle
- Build one feature with GitHub Spec Kit (spec-driven development)
- Mobile app version
