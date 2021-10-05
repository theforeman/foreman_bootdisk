import React, { useEffect } from 'react';
import { useSelector, useDispatch } from 'react-redux';

import { DropdownItem, DropdownGroup } from '@patternfly/react-core';

import { get } from 'foremanReact/redux/API';
import { foremanUrl } from 'foremanReact/common/helpers';
import { sprintf, translate as __ } from 'foremanReact/common/I18n';

import Loading from 'foremanReact/components/Loading';

import { HOST_BOOTDISK_BUTTONS_REQUEST_KEY } from '../constants';

import {
  selectHostId,
  selectIsLoading,
  selectBootdiskOptions,
} from './HostBootdiskButtonsSelectors';

const HostBootdiskButtons = () => {
  const dispatch = useDispatch();
  const hostId = useSelector(selectHostId);
  const isLoading = useSelector(selectIsLoading);
  const options = useSelector(selectBootdiskOptions);

  useEffect(() => {
    dispatch(
      get({
        key: HOST_BOOTDISK_BUTTONS_REQUEST_KEY,
        url: foremanUrl(`/bootdisk/disks/bootdisk_options/${hostId}`),
      })
    );
  }, [dispatch, hostId]);

  let content = null;
  if (options.bootdiskDownloadable) {
    content = options.actions.map((action, i) => (
      <DropdownItem
        key={`bootdisk-${i}`}
        href={foremanUrl(action.link)}
        isDisabled={action.disabled}
        description={action.description}
      >
        {action.title}
      </DropdownItem>
    ));
  } else {
    content = (
      <DropdownItem
        key="bootdisk-unavailable"
        component="button"
        href="#"
        tooltip={sprintf(
          __('Boot disk download not available for %s architecture'),
          options.architectureName
        )}
        tooltipProps={{ entryDelay: 0, exitDelay: 0 }}
      >
        {__('Not available')}
      </DropdownItem>
    );
  }

  return (
    <DropdownGroup label={__('Boot disk')} key="bootdisk-group">
      {isLoading ? <Loading showText={false} /> : content}
    </DropdownGroup>
  );
};

export default HostBootdiskButtons;
