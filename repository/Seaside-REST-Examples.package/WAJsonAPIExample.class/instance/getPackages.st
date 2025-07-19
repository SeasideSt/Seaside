json api
getPackages

	<get>
	<path: '/packages/'>
	<produces: 'application/json'>

	^ WAJsonCanvas builder render: [ :json |
			json array: [ 
				Smalltalk packages do:[ :package |
					json object: [
						json 
							key: 'name' value: package name;
							key: 'classes' value: [ json render: (package classes collect: [ :class | class name ]) ]  ] ] ] ]