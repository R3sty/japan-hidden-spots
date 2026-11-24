import { useState, useEffect } from "react";

function App() {
  const [status, setStatus] = useState("Checking...");

  useEffect(() => {
    async function checkServer() {
      try {
        setStatus("Checking...");
        const response = await fetch("/api/health");
        if (!response.ok) {
          throw new Error("server request failed");
        }
        const data = await response.json();
        setStatus(data.ok ? "Connected" : "Server is not Healthy");
      } catch (error) {
        console.error(error);
        setStatus("Connection failed");
      }
    }
    checkServer();
  }, []);

  return (
    <div className="min-h-screen flex flex-col items-center justify-center bg-slate-900">
      <h1 className="text-4xl font-bold text-white">Japan Hidden Spots</h1>
      <p className="text-white">Backend status: {status}</p>
    </div>
  );
}

/**
 Tailwind class	Purpose
  min-h-screen =	Minimum height of the screen
  flex	Enables = Flexbox
  items-center =	Centers vertically
  justify-center =	Centers horizontally
  bg-slate-900 =	Dark background
  text-4xl =	Large text
  font-bold =	Bold text
  text-white =	White text
 */

export default App;
