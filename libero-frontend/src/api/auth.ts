import httpClient from "./http-client";

const check = async () => {
  const response = await httpClient.get("/auth"); // TODO: handle error here or at call site?
  return response.status === 200 && !!response.data.authenticated;
};

export default {
  check
};
