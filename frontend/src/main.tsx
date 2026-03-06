import { createRoot } from "react-dom/client";
import App from "./App.tsx";
import "./index.css";

// Window error handler (browser)
window.addEventListener("error", (event) => {
  console.error("Window Error:", event.error);
});

// Unhandled promise rejection handler (browser)
window.addEventListener("unhandledrejection", (event) => {
  console.error("Unhandled Promise Rejection:", event.reason);
});

createRoot(document.getElementById("root")!).render(<App />);
