Class {
	#name : #WAAmbigousRouteHandler,
	#superclass : #WASwagger2RestfulHandler,
	#category : 'Seaside-Tests-Swagger-Core'
}

{ #category : #resources }
WAAmbigousRouteHandler >> json [
	<get>
	<path: '/resource'>
	<produces: 'application/json'>
	<consumes: 'application/json'>

	^ nil
]

{ #category : #resources }
WAAmbigousRouteHandler >> xml [
	<get>
	<path: '/resource'>
	<produces: 'text/xml'>
	<consumes: 'text/xml'>

	^ nil
]
