Class {
	#name : #WASwagger2SpecificationRenderingTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-Swagger-Core'
}

{ #category : #private }
WASwagger2SpecificationRenderingTest >> assert: anObject equals: aString [
	self
		assert: anObject = aString
		description: anObject, ' expected to be ', aString
		resumable: true
]

{ #category : #private }
WASwagger2SpecificationRenderingTest >> assert: aBlock rendersTo: aString [
	| actual |
	actual := WASwagger2SpecificationCanvas builder render: aBlock.
	self assert: actual equals: aString
]

{ #category : #tests }
WASwagger2SpecificationRenderingTest >> testBasicRendering [
	self
		assert: [ :swagger |
			swagger info: [
				swagger
					title: 'Swagger Sample App';
					description: 'This is a sample server Petstore server.';
					termsOfService: 'http://swagger.io/terms/';
					contact: [
						swagger
							name: 'API Support';
							url: 'http://www.swagger.io/support';
							email: 'support@swagger.io' ];
					license: [
						swagger
							name: 'Apache 2.0';
							url: 'http://www.apache.org/licenses/LICENSE-2.0.html' ];
					version: '1.0.1' ] ]
		rendersTo: '"info": {',
	'"title": "Swagger Sample App", ',
	'"description": "This is a sample server Petstore server.", ',
	'"termsOfService": "http://swagger.io/terms/", ',
	'"contact": {',
		'"name": "API Support", ',
		'"url": "http://www.swagger.io/support", ',
		'"email": "support@swagger.io"',
	'}, ',
	'"license": {',
		'"name": "Apache 2.0", ',
		'"url": "http://www.apache.org/licenses/LICENSE-2.0.html"',
	'}, ',
	'"version": "1.0.1"',
'}'
]

{ #category : #tests }
WASwagger2SpecificationRenderingTest >> testPaths [
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
]
