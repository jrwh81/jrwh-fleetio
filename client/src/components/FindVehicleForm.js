import React from 'react';


const FindVehicleForm = ({onFindVehicle = f => f}) => {
    let vin
    const submit = e => {
        e.preventDefault()
        onFindVehicle(vin.value)
        vin.value = ''
        vin.focus()
    }

	return (
        <form onSubmit={submit}>
            <input  ref={input => vin = input}
                    type="text"
                    defaultValue=""
                    placeholder="Enter VIN Here..." required />
            <button>Search</button>
        </form>
		)
}

export default FindVehicleForm;