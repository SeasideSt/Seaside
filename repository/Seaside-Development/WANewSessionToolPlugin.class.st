"
I create a new session.
"
Class {
	#name : #WANewSessionToolPlugin,
	#superclass : #WAToolPlugin,
	#category : 'Seaside-Development-Plugins'
}

{ #category : #accessing }
WANewSessionToolPlugin class >> title [
	^ 'New Session'
]

{ #category : #actions }
WANewSessionToolPlugin >> execute [
	self session unregister.
	self requestContext redirectTo: self application url
]

{ #category : #accessing }
WANewSessionToolPlugin >> label [
	^ 'New Session'
]

{ #category : #accessing }
WANewSessionToolPlugin >> priority [
	^ 100
]
