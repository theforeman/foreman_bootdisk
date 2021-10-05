import { testSelectorsSnapshotWithFixtures } from '@theforeman/test';

import {
  selectHostId,
  selectIsLoading,
  selectBootdiskOptions,
} from '../HostBootdiskButtonsSelectors';

import {
  HOST_DETAILS_REQUEST_KEY,
  HOST_BOOTDISK_BUTTONS_REQUEST_KEY,
} from '../../constants';

const stateFactory = (bootdiskState, hostState) => ({
  API: {
    [HOST_DETAILS_REQUEST_KEY]: {
      response: {
        ...hostState,
      },
    },
    [HOST_BOOTDISK_BUTTONS_REQUEST_KEY]: {
      response: {
        ...bootdiskState,
      },
    },
  },
});

const state = stateFactory(
  {
    bootdiskOptions: {
      bootdiskDownloadable: true,
      architectureName: 'x86_64',
      actions: [
        {
          title: "Host 'sppup' image",
          link: '/bootdisk/disks/hosts/8',
          disabled: false,
          description: null,
        },
        {
          title: "Full host 'sppup' image",
          link: '/bootdisk/disks/full_hosts/8',
          disabled: true,
          description: 'Host is not in build mode',
        },
        {
          title: 'Boot disk help',
          link: '/bootdisk/disks/help',
        },
      ],
    },
  },
  {
    id: 8,
  }
);

const fixtures = {
  'should return options': () => selectBootdiskOptions(state),
  'should return isLoading': () => selectIsLoading(state),
  'should return hostId': () => selectHostId(state),
};

describe('HostBootdiskButtons selectors', () =>
  testSelectorsSnapshotWithFixtures(fixtures));
