import axios from "axios";

console.log("API BASE", process.env.VUE_APP_API_BASE_URL);

const httpClient = axios.create({
  baseURL: process.env.VUE_APP_API_BASE_URL,
  headers: {
    Accept: "application/json"
  }
});

export default httpClient;
