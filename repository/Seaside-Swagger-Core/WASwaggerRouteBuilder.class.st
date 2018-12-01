Class {
	#name : #WASwaggerRouteBuilder,
	#superclass : #WARouteBuilder,
	#instVars : [
		'tags',
		'responses'
	],
	#category : 'Seaside-Swagger-Core'
}

{ #category : #initialization }
WASwaggerRouteBuilder class >> initialize [
	configuration := IdentitySet new.
	(Pragma allNamed: #configuration from: self to: WARouteBuilder)
		do: [ :pragma | configuration add: pragma method selector ]
]

{ #category : #private }
WASwaggerRouteBuilder >> create [
	^ WASwaggerRouteWrapper new
		route: super create;
		path: path;
		tags: tags;
		responses: responses;
		yourself
]

{ #category : #initialization }
WASwaggerRouteBuilder >> initialize [
	super initialize.
	tags := Set new.
	responses := Set new
]

{ #category : #configuration }
WASwaggerRouteBuilder >> swaggerresponds: anInteger object: aMessage [
	<configuration>
	
	responses add: anInteger -> aMessage
	
]

{ #category : #configuration }
WASwaggerRouteBuilder >> swaggertags: aCollection [
	<configuration>
	
	tags := aCollection
]
