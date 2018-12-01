Class {
	#name : #WAMimeTypeHandlerTest,
	#superclass : #WASwagger2RestfulHandlerTest,
	#category : 'Seaside-Tests-Swagger-Core'
}

{ #category : #testing }
WAMimeTypeHandlerTest >> expectedConfigurationFile [
	^ '{"swagger": "2.0", "info": {"title": "Swagger", "version": "1.0"}, "basePath": "/config-api", "paths": {"/swagger.json": {"get": {"produces": "application/json", "responses": {}}}, "multiple-comment": {"get": {"produces": "text/plain", "responses": {}}}, "comment": {"get": {"produces": "text/plain", "consumes": "application/x-www-form-urlencoded", "responses": {}}}}}'
]

{ #category : #private }
WAMimeTypeHandlerTest >> handlerClass [
	^ WAMimeTypeHandler
]
