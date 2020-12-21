import httpClient from "./http-client";

const check = async () => {
  try {
    const response = await httpClient.get("/auth");
    return response.status === 200 && !!response.data.authenticated; // TODO: put user profile into store
  } catch {
    return false;
  }
};

export default {
  check
};
