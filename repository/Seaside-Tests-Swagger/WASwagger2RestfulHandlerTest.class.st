Class {
	#name : #WASwagger2RestfulHandlerTest,
	#superclass : #WARequestHandlerTest,
	#category : 'Seaside-Tests-Swagger'
}

{ #category : #private }
WASwagger2RestfulHandlerTest >> handlerName [
	^ 'config-api'
]

{ #category : #private }
WASwagger2RestfulHandlerTest >> newHandler [
	^ WAConfigurationHandler new
]

{ #category : #testing }
WASwagger2RestfulHandlerTest >> testSwaggerSpecificationFile [
	| file |
	file := handler getSwaggerSpecificationFile.
	self assert: file = '{"swagger": "2.0", "info": {"title": "Swagger", "version": "1.0"}, "basePath": "/config-api", "paths": {"/swagger.json": {"get": {"tags": [], "produces": "application/json", "responses": {}}}, "/dispatchers": {"get": {"tags": ["dispatchers"], "produces": "application/json", "responses": {"200": {"description": "Get your dispatchers"}}}}, "/dispatchers/{aName}": {"get": {"tags": ["dispatchers"], "produces": "application/json", "responses": {}}}}}'
]
