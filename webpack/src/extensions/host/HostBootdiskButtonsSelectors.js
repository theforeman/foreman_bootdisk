import { STATUS } from 'foremanReact/constants';
import {
  selectAPIStatus,
  selectAPIResponse,
} from 'foremanReact/redux/API/APISelectors';

import {
  HOST_BOOTDISK_BUTTONS_REQUEST_KEY,
  HOST_DETAILS_REQUEST_KEY,
} from '../constants';

const selectHostButtonsResponse = state =>
  selectAPIResponse(state, HOST_BOOTDISK_BUTTONS_REQUEST_KEY) || {};

export const selectBootdiskOptions = state =>
  selectHostButtonsResponse(state).bootdiskOptions || {};

const selectHostButtonsStatus = state =>
  selectAPIStatus(state, HOST_BOOTDISK_BUTTONS_REQUEST_KEY);

export const selectIsLoading = state => {
  const status = selectHostButtonsStatus(state);
  return !status || status === STATUS.PENDING;
};

export const selectHostId = state =>
  selectAPIResponse(state, HOST_DETAILS_REQUEST_KEY).id;
