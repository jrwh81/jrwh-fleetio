import React, { Component } from 'react';
import { Container, Image, Header, Icon } from 'semantic-ui-react'
import './App.css';
import './Home.css';
import VehiclesContainer from './components/VehiclesContainer'
import fleetio from './images/fleetio.png';

class Home extends Component {
  render() { 
    return (
  <div>
    <Header id="topHeader">
      <Image src={fleetio} />
      Sample Work Website By John Hansen
    </Header>    
    <Container fluid>
      <Container fluid id="mainContent">
      <div id="vinSearch">
        <Icon name='car' size='massive' />
        <Header id="vinHeader"as='h2'>VIN Search</Header>

        <VehiclesContainer />
      </div>
      </Container>
    </Container>
  </div>
    );
  }
}

export default Home;