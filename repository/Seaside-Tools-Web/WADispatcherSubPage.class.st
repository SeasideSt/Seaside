Class {
	#name : #WADispatcherSubPage,
	#superclass : #WAComponent,
	#instVars : [
		'parent'
	],
	#category : 'Seaside-Tools-Web'
}

{ #category : #accessing }
WADispatcherSubPage >> parent [
	^ parent
]

{ #category : #accessing }
WADispatcherSubPage >> parent: anObject [
	parent := anObject
]
