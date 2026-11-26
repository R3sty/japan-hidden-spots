const express = require("express"); //holds the Express module that we imported using require()
const app = express(); //express() calls the function exported by the Express module. app holds the Express application instance created by calling express().
const PORT = process.env.PORT || 3000;
const pool = require("../db/pool");

app.get("/api/health", async (req, res) => {
  try {
    const result = await pool.query("SELECT NOW()");

    res.json({
      ok: true,
      database: "connected",
      time: result.rows[0].now,
    });
  } catch (error) {
    console.error("Database health check failed:", error.message);

    res.status(500).json({
      ok: false,
      database: "disconnected",
    });
  }
});

app.listen(PORT, (error) => {
  if (error) {
    throw error;
  }
  console.log(`server is running on port http://localhost:${PORT}`);
});
