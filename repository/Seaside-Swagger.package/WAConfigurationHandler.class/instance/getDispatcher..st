handlers
getDispatcher: aName
	<get>
	<path: '/dispatchers/{aName}'>
	<produces: 'application/json'>
	
	<swaggertags: #('dispatchers')>
	
	| dispatcher |
	dispatcher := WAAdmin defaultDispatcher handlerAt: aName.
	^ WAJsonCanvas builder 
		documentClass: WAJsonDocument;
		render: [ :json |
			json value:
				dispatcher class name ]