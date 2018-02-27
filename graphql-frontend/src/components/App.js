import React, { Component } from 'react';
import LinkList from './LinkList';
import CreateLink from './CreateLink';

class App extends Component {
  render() {
    return <React.Fragment>
      <LinkList />
      <CreateLink />
    </React.Fragment>
  }
}

export default App;
