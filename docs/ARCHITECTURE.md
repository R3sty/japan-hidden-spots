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

## How tables connect: an example

A simplified, made-up example in the style of YouTube (their real database isn't public).

```mermaid
erDiagram
    USERS ||--o{ VIDEOS : "uploads"
    USERS {
        int id PK "unique number, auto-created"
        string email
        string display_name
        string password_hash "never the real password"
        date created_at
    }
    VIDEOS {
        int id PK
        int user_id FK "points to users.id"
        string title
        int views
    }
```

**users**
| id (PK) | email | display_name | password_hash | created_at |
|---|---|---|---|---|
| 1 | ryan@mail.com | Ryan | $2b$10$Xk9... | 2026-11-08 |
| 2 | resty@mail.com | Resty | $2b$10$Pq3... | 2026-11-08 |

**videos**
| id (PK) | user_id (FK → users.id) | title | views |
|---|---|---|---|
| 101 | **1** | Hidden ramen in Gunma | 520 |
| 102 | **1** | Osaka street food | 1,200 |
| 103 | **2** | Kyoto temples | 300 |

What to notice:
- **Primary key (PK):** `id` is unique for every row, so each row can be found exactly.
- **Foreign key (FK):** `videos.user_id` stores the id of the owner. Videos 101 and 102 have `user_id = 1`, so they belong to Ryan.
- **One-to-many:** one user can have many videos, but each video has one owner.
- **Passwords** are stored only as a bcrypt hash, never as plain text.
- Real apps often use long random IDs (YouTube channel IDs look like `UC_x5XG1OV2P6uZZ5FSM9Ttw`) so they can't be guessed.

**In our app:** swap videos for **spots**. Reviews connect to *two* tables: each review has a `user_id` (who wrote it) and a `spot_id` (which spot it's about).

## Repo layout (from Sprint 1)

```
japan-hidden-spots/
├── client/     React app (frontend)
├── server/     Express API (backend)
└── docs/       Playbook, architecture
```
