export const API_URL = process.env.NODE_ENV === "test"
  ? "http://some-test-url"
  : (import.meta.env.VITE_API_URL || "https://recipes-for-good.fly.dev/api/v1") // TODO: use properylu dotenv in production
