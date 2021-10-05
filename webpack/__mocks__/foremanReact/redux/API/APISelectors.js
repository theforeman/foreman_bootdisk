export const selectAPIResponse = (state, key) =>
  selectAPIByKey(state, key).response;

export const selectAPIStatus = (state, key) => 'PENDING';
export const selectAPIByKey = (state, key) => state.API[key];
export const selectAPIError = (state, key) => ({ error: `${key} ERRROR` });
