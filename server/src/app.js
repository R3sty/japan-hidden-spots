const express = require("express"); //holds the Express module that we imported using require()
const app = express(); //express() calls the function exported by the Express module. app holds the Express application instance created by calling express().
const PORT = 3000;

app.get("/api/health", (req, res) => {
  res.json({ ok: true });
});

app.listen(PORT, (error) => {
  if (error) {
    throw error;
  }
  console.log(`server is running on port http://localhost:${PORT}`);
});
