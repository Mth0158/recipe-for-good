export const API_URL = process.env.NODE_ENV === "test"
  ? "http://some-test-url"
  : import.meta.env.VITE_API_URL