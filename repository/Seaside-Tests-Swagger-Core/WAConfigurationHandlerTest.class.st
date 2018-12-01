Class {
	#name : #WAConfigurationHandlerTest,
	#superclass : #WASwagger2RestfulHandlerTest,
	#category : 'Seaside-Tests-Swagger-Core'
}

{ #category : #testing }
WAConfigurationHandlerTest >> expectedConfigurationFile [
	^ '{"swagger": "2.0", "info": {"title": "Swagger", "version": "1.0"}, "basePath": "/config-api", "paths": {"/swagger.json": {"get": {"produces": "application/json", "responses": {}}}, "/dispatchers": {"get": {"tags": ["dispatchers"], "produces": "application/json", "responses": {"200": {"description": "Get your dispatchers"}}}}, "/dispatchers/{aName}": {"get": {"tags": ["dispatchers"], "produces": "application/json", "responses": {}}}}}'
]

{ #category : #private }
WAConfigurationHandlerTest >> handlerClass [
	^ WAConfigurationHandler
]
