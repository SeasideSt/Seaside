Class {
	#name : #WAMimeTypeHandler,
	#superclass : #WASwagger2RestfulHandler,
	#category : 'Seaside-Tests-Swagger-Core'
}

{ #category : #resources }
WAMimeTypeHandler >> comment [
	<get>
	<produces: 'text/plain'>
	<consumes: 'application/x-www-form-urlencoded'>

	^ nil
]

{ #category : #resources }
WAMimeTypeHandler >> multipleComment [
	<get>
	<path: 'multiple-comment'>
	<produces: 'text/plain'>
	<consumes: 'application/x-www-form-urlencoded'>
	<consumes: 'text/xml'>

	^ nil
]
