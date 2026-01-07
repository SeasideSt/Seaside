Class {
	#name : 'WAProfilerToolPlugin',
	#superclass : 'WAToolPlugin',
	#instVars : [
		'filter'
	],
	#category : 'Seaside-GemStone-Development-Core',
	#package : 'Seaside-GemStone-Development',
	#tag : 'Core'
}

{ #category : 'actions' }
WAProfilerToolPlugin >> execute [
	self isProfiling
		ifFalse: [ self session addFilter: self filter reset ]
		ifTrue: [
			self session removeFilter: self filter.
			self open: (WAProfilerTool on: self filter items) ]
]

{ #category : 'accessing' }
WAProfilerToolPlugin >> filter [
	^ filter ifNil: [ filter := WAProfilerFilter new ]
]

{ #category : 'testing' }
WAProfilerToolPlugin >> isProfiling [
	^ self session filters includes: self filter
]

{ #category : 'accessing' }
WAProfilerToolPlugin >> label [
	^ self isProfiling
		ifFalse: [ 'Profile' ]
		ifTrue: [ 'Stop Profile' ]
]

{ #category : 'accessing' }
WAProfilerToolPlugin >> priority [
	^ 400
]
