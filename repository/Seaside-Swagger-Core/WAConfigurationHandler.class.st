Class {
	#name : #WAConfigurationHandler,
	#superclass : #WASwagger2RestfulHandler,
	#category : 'Seaside-Swagger-Core'
}

{ #category : #scripting }
WAConfigurationHandler class >> registration [
	WAAdmin register: self at: 'config-api'
]

{ #category : #swagger }
WAConfigurationHandler >> dispatchersResponse [
	^ Dictionary new
		at: 'description' put: 'Get your dispatchers';
		yourself
]

{ #category : #handlers }
WAConfigurationHandler >> getDispatcher: aName [
	<get>
	<path: '/dispatchers/{aName}'>
	<produces: 'application/json'>
	
	<swaggertags: #('dispatchers')>
	
	| dispatcher |
	dispatcher := WAAdmin defaultDispatcher handlerAt: aName.
	^ WAJsonCanvas builder 
		documentClass: WAJsonDocument;
		render: [ :json |
			json value: dispatcher class name ]
]

{ #category : #handlers }
WAConfigurationHandler >> getDispatchers [
	<get>
	<path: '/dispatchers'>
	<produces: 'application/json'>
	
	<swaggertags: #('dispatchers')>
	<swaggerresponds: 200 object: #dispatchersResponse>
	
	^ WAJsonCanvas builder 
		documentClass: WAJsonDocument;
		render: [ :json |
			json object: [
				WAAdmin defaultDispatcher handlers keysAndValuesDo: [ :name :handler |
					json key: name value: handler class name ] ] ]
]
