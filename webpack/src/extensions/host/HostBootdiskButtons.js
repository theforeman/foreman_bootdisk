import React, { useEffect } from 'react';
import { useSelector, useDispatch } from 'react-redux';

import {
  DropdownItem,
  DropdownGroup,
  DropdownList,
  Divider,
} from '@patternfly/react-core';
import {
  BanIcon,
  BuildIcon,
  BuilderImageIcon,
  OutlinedQuestionCircleIcon,
} from '@patternfly/react-icons';

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
import './HostBootdiskButtons.scss';

const HostBootdiskButtons = () => {
  const dispatch = useDispatch();
  const hostId = useSelector(selectHostId);
  const isLoading = useSelector(selectIsLoading);
  const options = useSelector(selectBootdiskOptions);

  const iconComponent = icon => {
    switch (icon) {
      case 'host':
        return <BuildIcon />;
      case 'full_host':
        return <BuilderImageIcon />;
      case 'help':
        return <OutlinedQuestionCircleIcon />;
      default:
        return null;
    }
  };

  useEffect(() => {
    dispatch(
      get({
        key: HOST_BOOTDISK_BUTTONS_REQUEST_KEY,
        url: foremanUrl(`/disks/bootdisk_options/${hostId}`),
      })
    );
  }, [dispatch, hostId]);

  let content = null;
  if (options.bootdiskDownloadable) {
    content = options.actions.map((action, i) => (
      <DropdownItem
        key={`bootdisk-${i}`}
        to={foremanUrl(action.link)}
        isDisabled={action.disabled}
        description={action.description}
        icon={iconComponent(action.icon)}
        ouiaId={`bootdisk button ${i}`}
      >
        {action.title}
      </DropdownItem>
    ));
  } else {
    content = (
      <DropdownItem
        key="bootdisk-unavailable"
        ouiaId="bootdisk button unavailable"
        component="button"
        to="#"
        tooltipProps={{
          content: sprintf(
            __('Boot disk download not available for %s architecture'),
            options.architectureName
          ),
          entryDelay: 0,
          exitDelay: 0,
        }}
        icon={<BanIcon />}
      >
        {__('Not available')}
      </DropdownItem>
    );
  }

  return (
    <>
      <Divider component="li" />
      <DropdownGroup
        className="bootdisk-group-group"
        label={__('Boot disk')}
        key="bootdisk-group"
      >
        <DropdownList>
          {isLoading ? <Loading showText={false} /> : content}
        </DropdownList>
      </DropdownGroup>
      <Divider key="separator" />
    </>
  );
};

export default HostBootdiskButtons;
