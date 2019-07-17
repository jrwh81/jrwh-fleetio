import React, { Component } from 'react';
import axios from 'axios';
import Vehicle from './Vehicle'
import FindVehicleForm from './FindVehicleForm';
import { Divider, Table } from 'semantic-ui-react';

class VehiclesContainer extends Component {
	constructor(props){
		super(props)
		this.state = {
			vehicles: [],
			message: " ",
			vin: null
		}
		this.findVehicle = this.findVehicle.bind(this)
	}

	componentDidMount(){
		axios.get('/api/vehicles')
		.then(response => {
			console.log(response)
			this.setState({
				vehicles: response.data
			})
		})
		.catch(error => console.log(error))
	}

	findVehicle(vin){
		console.log("VIN====="+vin)
		axios.get( 'api/vehicles/find/' + vin)
		.then(response => {
			console.log(response)
			const vehicles = response.data.vehicles
			const message = response.data.message
			console.log(vehicles)
			console.log(message)
			this.setState({vehicles})
			this.setState({message})
		})
		.catch(error => {
			console.log(error)
		})
	}

	render() {
		return (			
			<div className="Vehicles-container">
				<FindVehicleForm onFindVehicle={this.findVehicle} />
				<Divider horizontal>Vehicles</Divider>
				  <Table basic='very'>
				    <Table.Header>
				      <Table.Row>
				      	<Table.HeaderCell>Status</Table.HeaderCell>
				        <Table.HeaderCell>Name</Table.HeaderCell>
				        <Table.HeaderCell>Make</Table.HeaderCell>
				        <Table.HeaderCell>Model</Table.HeaderCell>
				        <Table.HeaderCell>Color</Table.HeaderCell>
				        <Table.HeaderCell>Year</Table.HeaderCell>
				      </Table.Row>
				    </Table.Header>

				    <Table.Body>
							{this.state.vehicles.map( (vehicle, i) => {
								return (<Vehicle vehicle={vehicle} key={i} />)
							})}	      
				    </Table.Body>
				  </Table>				
			</div>
		)
	}
}

export default VehiclesContainer