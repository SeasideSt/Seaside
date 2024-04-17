Class {
	#name : #WARestfulCleanHandler,
	#superclass : #WARestfulHandler,
	#category : #'Seaside-Stateless-Core'
}

{ #category : #private }
WARestfulCleanHandler >> routeForContext: aRequestContext ifAbsent: aNiladicBlock [
	^ (WAByMethodCleanRoutes routes: self routes)
		routeForContext: aRequestContext
		consume: self shouldConsumePath
		ifAbsent: aNiladicBlock
]
