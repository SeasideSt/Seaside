handlers
getDispatchers
	<get>
	<path: '/dispatchers'>
	<produces: 'application/json'>
	
	<swaggertags: #('dispatchers')>
	<swaggerresponds: 200 object: #dispatchersResponse>
	
	^ WAJsonCanvas builder 
		documentClass: WAJsonDocument;
		render: [ :json |
			json object: [
				WAAdmin defaultDispatcher handlers keysAndValuesDo: [ :name :handler |
					json key: name value: handler class name ] ] ]