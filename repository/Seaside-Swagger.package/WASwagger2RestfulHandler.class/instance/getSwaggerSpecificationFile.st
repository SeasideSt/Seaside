resources
getSwaggerSpecificationFile

	<get>
	<path: '/swagger.json'>

	^ WAJsonCanvas builder 
		documentClass: WAJsonDocument;
		render: [ :json | self renderSwaggerObjectOn: json ]