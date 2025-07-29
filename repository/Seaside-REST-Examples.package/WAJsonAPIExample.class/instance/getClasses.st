json api
getClasses

	<get>
	<path: '/classes/'>
	<produces: 'application/json'>

	^ WAJsonCanvas builder render: [ :json |
			json array: [ 
				Smalltalk allClasses do:[ :class |
					json object: [
						json 
							key: 'name' value: class name;
							key: 'instvars' value: [ json array: [ class instVarNames do: [ :iv | json string: iv ] ] ] ] ] ] ]