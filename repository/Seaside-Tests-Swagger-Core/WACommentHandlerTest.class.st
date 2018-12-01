Class {
	#name : #WACommentHandlerTest,
	#superclass : #WASwagger2RestfulHandlerTest,
	#category : 'Seaside-Tests-Swagger-Core'
}

{ #category : #testing }
WACommentHandlerTest >> expectedConfigurationFile [
	^ '{"swagger": "2.0", "info": {"title": "Swagger", "version": "1.0", "description": "This is the class comment."}, "basePath": "/config-api", "paths": {"/comment.txt": {"get": {"description": "This is the method comment", "responses": {}}}, "/swagger.json": {"get": {"produces": "application/json", "responses": {}}}}}'
]

{ #category : #private }
WACommentHandlerTest >> handlerClass [
	^ WACommentHandler
]
