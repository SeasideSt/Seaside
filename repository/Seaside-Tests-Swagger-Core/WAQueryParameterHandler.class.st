Class {
	#name : #WAQueryParameterHandler,
	#superclass : #WASwagger2RestfulHandler,
	#category : 'Seaside-Tests-Swagger-Core'
}

{ #category : #resources }
WAQueryParameterHandler >> searchFor: query [
    <get>
    <path: '/search?q={query}'>
]
