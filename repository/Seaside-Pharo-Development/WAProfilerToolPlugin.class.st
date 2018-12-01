"
I display the rendering profiler.
"
Class {
	#name : #WAProfilerToolPlugin,
	#superclass : #WAToolPlugin,
	#instVars : [
		'filter'
	],
	#category : 'Seaside-Pharo-Development-Core-Profiler'
}

{ #category : #actions }
WAProfilerToolPlugin >> execute [
	self isProfiling
		ifFalse: [ self session addFilter: self filter reset ]
		ifTrue: [
			self session removeFilter: self filter.
			self open: (WAProfilerTool on: self filter items) ]
]

{ #category : #accessing }
WAProfilerToolPlugin >> filter [
	^ filter ifNil: [ filter := WAProfilerFilter new ]
]

{ #category : #testing }
WAProfilerToolPlugin >> isProfiling [
	^ self session filters includes: self filter
]

{ #category : #accessing }
WAProfilerToolPlugin >> label [
	^ self isProfiling
		ifFalse: [ 'Profile' ]
		ifTrue: [ 'Stop Profile' ]
]

{ #category : #accessing }
WAProfilerToolPlugin >> priority [
	^ 400
]
