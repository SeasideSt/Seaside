resources
getSwaggerSpecificationFile

	<get>
	<path: '/swagger.json'>
	<produces: 'application/json'>

	^ WASwagger2SpecificationCanvas builder
		render: [ :swagger | self renderSwaggerObjectOn: swagger ]