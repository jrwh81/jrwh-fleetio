import React from 'react';
import { Icon, Table, Popup, Grid, Image } from 'semantic-ui-react';

const Vehicle = ({vehicle}) =>
  <Popup trigger={	
  	<Table.Row>
		<Table.Cell className="single-vehicle" key={vehicle.id}>
			<h4><Icon color={vehicle.vehicle_status_color} name='circle' />&nbsp;&nbsp;{vehicle.vehicle_status_name}</h4>
		</Table.Cell>
		<Table.Cell>
			<h4>{vehicle.name}</h4>
		</Table.Cell>		
		<Table.Cell>
			<h4>{vehicle.make}</h4>
		</Table.Cell>
		<Table.Cell>
			<h4>{vehicle.model}</h4>
		</Table.Cell>		
		<Table.Cell>
			<h4>{vehicle.color}</h4>
		</Table.Cell>
		<Table.Cell>
			<h4>{vehicle.year}</h4>
		</Table.Cell>
	</Table.Row> } flowing hoverable>
	  <Grid columns='three' divided>
	    <Grid.Row>
	      <Grid.Column>
	      	<h4>{vehicle.name}</h4>
	      	<Image src={vehicle.default_image_url_medium} circular/>
	      </Grid.Column>
	      <Grid.Column>
	      	<h4>Odometer:</h4>
	      	{vehicle.current_meter_value}
	      </Grid.Column>	      
	      <Grid.Column>
	      	<h4>Group Name:</h4>
	      	{vehicle.group_name}
	      </Grid.Column>	      
	    </Grid.Row>
	    <Grid.Row>
	      <Grid.Column>
	      	<h4>VIN:</h4>
	      	{vehicle.vin}
	      </Grid.Column>	    
	      <Grid.Column>
	      	<h4>License Plate:</h4>
	      	{vehicle.license_plate}
	      </Grid.Column>
	      <Grid.Column>
	      	<h4>Registered State:</h4>
	      	{vehicle.registration_state}
	      </Grid.Column>	      
	    </Grid.Row>
	  </Grid>
  </Popup>
export default Vehicle;