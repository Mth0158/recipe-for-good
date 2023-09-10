export const API_URL = process.env.NODE_ENV === "test"
  ? "http://some-test-url"
  : "https://recipes-for-good.fly.dev/api/v1" // TODO: use the VITE_API_URL and dotenv in production
