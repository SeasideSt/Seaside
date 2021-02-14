Extension { #name : #WAObject }

{ #category : #'*seaside-session' }
WAObject >> application [
	"Answer the current seaside application, instance of WAApplication or a subclass."
	
	^ self requestContext application
]

{ #category : #'*seaside-session' }
WAObject >> session [
	"Answer the current seaside session, instance of WASession or a subclass."
	
	^ self requestContext session
]
