Class {
	#name : 'WAObjectsReadToolPlugin',
	#superclass : 'WAToolPlugin',
	#instVars : [
		'filter'
	],
	#category : 'Seaside-GemStone-Development-Core',
	#package : 'Seaside-GemStone-Development',
	#tag : 'Core'
}

{ #category : 'actions' }
WAObjectsReadToolPlugin >> execute [
	self isProfiling
		ifFalse: [ self session addFilter: self filter reset ]
		ifTrue: [
			self session removeFilter: self filter.
			self open: (WAObjectsReadTool on: self filter items) ]
]

{ #category : 'accessing' }
WAObjectsReadToolPlugin >> filter [
	^ filter ifNil: [ filter := WAObjectsReadFilter new ]
]

{ #category : 'testing' }
WAObjectsReadToolPlugin >> isProfiling [
	^ self session filters includes: self filter
]

{ #category : 'accessing' }
WAObjectsReadToolPlugin >> label [
	^ self isProfiling
		ifFalse: [ 'ObjectsRead' ]
		ifTrue: [ 'Stop ObjectsRead' ]
]

{ #category : 'accessing' }
WAObjectsReadToolPlugin >> priority [
	^ 450
]
