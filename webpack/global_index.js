import React from 'react';

import { addGlobalFill } from 'foremanReact/components/common/Fill/GlobalFill';

import HostBootdiskButtons from './src/extensions/host/HostBootdiskButtons';

const HOST_BOOTDISK_BUTTONS_WEIGHT = 300;

addGlobalFill(
  'host-details-kebab',
  'host-bootdisk-buttons',
  <HostBootdiskButtons key="host-bootdisk-buttons" />,
  HOST_BOOTDISK_BUTTONS_WEIGHT
);
