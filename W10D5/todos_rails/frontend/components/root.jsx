import React from 'react';
import { Provider } from 'react-redux';
import APP from './app';

const Root = ({ store }) => (
    <Provider store={store}>
        <APP />
    </Provider>
)

export default Root;