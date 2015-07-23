tests
testPaths
	self
		assert: [ :swagger |
			swagger paths: [
			swagger path: '/pets' item: [
				swagger get: [
					swagger
						description: 'Returns all pets from the system that the user has access to';
						produces: #('application/json');
						responses: [
							swagger status: 200 response: [
								swagger
									description: 'A list of pets.';
									schema: [
										swagger
											type: 'array';
 											items: [
												swagger externalReference: '#/definitions/pet' ] ] ] ] ] ] ] ]
		rendersTo: '"paths": {',
  '"/pets": {',
    '"get": {',
      '"description": "Returns all pets from the system that the user has access to", ',
      '"produces": [',
        '"application/json"',
      '], ',
      '"responses": {',
        '"200": {',
          '"description": "A list of pets.", ',
          '"schema": {',
            '"type": "array", ',
            '"items": {',
              '"$ref": "#/definitions/pet"}}}}}}}'