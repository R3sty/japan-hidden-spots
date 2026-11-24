# Japan Hidden Spots

A web app to share and review hidden tourist spots, family-owned restaurants and food stalls in Japan.

> 🚧 In development. Target v1: December 2026.

## Features (v1)

- Sign up / log in
- Add spots with prefecture, category and description
- Browse and filter by prefecture/category
- Reviews and 1–5 star ratings
- Edit/delete your own spots

## Tech stack

React + Vite · Tailwind CSS · Node.js + Express · PostgreSQL · Supertest · GitHub Actions

## Team

- **Ryan**: Developer
- **Resty**: Tech lead / product owner

## How we work

See [docs/PLAYBOOK.md](docs/PLAYBOOK.md) for the roadmap, workflow and AI guidelines.

## Getting Started

### Prerequisites

- Node.js
- npm

### Installation

Clone the repository, then install the dependencies for both applications.

**Frontend:**

```bash
cd client
npm install
```

**Backend:**

Open a separate terminal from the project root:

```bash
cd server
npm install
```

### Running the application

You need two terminals to run the frontend and backend simultaneously.

**1. Start the backend:**

```bash
cd server
npm run dev
```

The Express server runs at `http://localhost:3000`.

**2. Start the frontend:**

In another terminal:

```bash
cd client
npm run dev
```

The Vite development server runs at `http://localhost:5173`.

Open `http://localhost:5173` in your browser to access the application.

The frontend communicates with the backend through the Vite development proxy configured for `/api`.
