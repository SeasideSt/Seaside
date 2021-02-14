Extension { #name : #WARequestContext }

{ #category : #'*seaside-renderloop' }
WARequestContext >> rootComponent: aComponent [
	"Set the root component for the render loop.
	If this message is sent before a session is created the given component will be used as the root component of the render loop instead of the root component configured on the application."
	self properties at: #rootComponent put: aComponent
]

{ #category : #'*seaside-renderloop' }
WARequestContext >> rootComponentIfAbsent: aNiladicBlock [
	"Answer the root component if set, the value of aNiladicBlock if not set."
	^ self properties at: #rootComponent ifAbsent: aNiladicBlock
]
