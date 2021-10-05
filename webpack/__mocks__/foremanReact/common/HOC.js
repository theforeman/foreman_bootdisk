import React, { useEffect, useRef } from 'react';

export const withRenderHandler = ({ Component }) => componentProps => (
  <Component {...componentProps} />
);

export const callOnMount = callback => WrappedComponent => componentProps => {
  callback(componentProps);

  return <WrappedComponent {...componentProps} />;
};

export const callOnPopState = callback => WrappedComponent => componentProps => {
  const didMount = useRef(false);
  const {
    history: {
      action,
      location: { search },
    },
  } = componentProps;
  useEffect(() => {
    if (action === 'POP' && didMount.current) {
      callback(componentProps);
    } else {
      didMount.current = true;
    }
  }, [search, action, componentProps]);

  return <WrappedComponent {...componentProps} />;
};
