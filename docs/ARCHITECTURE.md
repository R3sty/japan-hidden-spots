# Architecture

> Before reading: try drawing it yourself first. How does a spot get from a user's browser into the database and back?

## Big picture

```mermaid
flowchart LR
    U["👤 User<br/>(browser)"] --> FE["Frontend<br/>React + Vite<br/>(Vercel)"]
    FE -- "HTTP requests (JSON)<br/>fetch /api/..." --> BE["Backend API<br/>Node + Express<br/>(Render)"]
    BE -- "SQL queries" --> DB[("Database<br/>PostgreSQL<br/>(Neon)")]
    DB -- rows --> BE
    BE -- "JSON response" --> FE
```

## What each part does

| Part | Job | Example |
|---|---|---|
| Frontend | Shows pages, forms, handles clicks | Spot list page, "Add spot" form |
| Backend API | Rules + security: checks login, validates input, talks to DB | `POST /api/spots` checks the user is logged in, saves the spot |
| Database | Stores data permanently | users, spots, reviews tables |

## One request, step by step: "Add a spot"

```mermaid
sequenceDiagram
    actor U as User
    participant FE as React (browser)
    participant BE as Express API
    participant DB as PostgreSQL
    U->>FE: Fills form, clicks "Save"
    FE->>BE: POST /api/spots {name, prefecture, ...} + login token
    BE->>BE: Check token (who is this?) + validate input
    BE->>DB: INSERT INTO spots ...
    DB-->>BE: New spot row (id 42)
    BE-->>FE: 201 Created {id: 42, ...}
    FE-->>U: Shows the new spot page
```

## Data model (draft, Ryan to refine in Issue #4)

```mermaid
erDiagram
    USERS ||--o{ SPOTS : "adds"
    USERS ||--o{ REVIEWS : "writes"
    SPOTS ||--o{ REVIEWS : "has"
    USERS {
        int id PK
        string email
        string password_hash
        string display_name
    }
    SPOTS {
        int id PK
        int user_id FK
        string name
        string prefecture
        string category
        text description
    }
    REVIEWS {
        int id PK
        int spot_id FK
        int user_id FK
        int rating "1-5"
        text comment
    }
```

## Repo layout (from Sprint 1)

```
japan-hidden-spots/
├── client/     React app (frontend)
├── server/     Express API (backend)
└── docs/       Playbook, architecture
```
