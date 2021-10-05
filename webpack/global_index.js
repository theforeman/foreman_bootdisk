import React from 'react';

import { addGlobalFill } from 'foremanReact/components/common/Fill/GlobalFill';

import HostBootdiskButtons from './src/extensions/host/HostBootdiskButtons';

addGlobalFill(
  'host-details-kebab',
  'host-bootdisk-buttons',
  <HostBootdiskButtons key="host-bootdisk-buttons" />,
  300
);
