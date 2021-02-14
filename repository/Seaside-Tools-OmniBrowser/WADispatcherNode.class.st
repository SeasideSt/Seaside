Class {
	#name : #WADispatcherNode,
	#superclass : #WAHandlerNode,
	#category : 'Seaside-Tools-OmniBrowser'
}

{ #category : #testing }
WADispatcherNode >> canHaveChildren [
	^ true
]

{ #category : #accessing }
WADispatcherNode >> children [
	^ (handler handlers collect: [ :each | each asNode ])
		asSortedCollection: [ :a :b | a name < b name ]
]

{ #category : #public }
WADispatcherNode >> name [
	^ super name, '/'
]
