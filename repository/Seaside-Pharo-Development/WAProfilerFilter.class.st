Class {
	#name : #WAProfilerFilter,
	#superclass : #WARequestFilter,
	#instVars : [
		'items'
	],
	#category : 'Seaside-Pharo-Development-Core-Profiler'
}

{ #category : #processing }
WAProfilerFilter >> handleFiltered: aRequestContext [
	| item |
	item := WAProfilerItem request: aRequestContext request copy.
	[ item profile: [ super handleFiltered: aRequestContext ] ]
		ensure: [ items := items copyWith: item ]
]

{ #category : #accessing }
WAProfilerFilter >> items [
	^ items
]

{ #category : #actions }
WAProfilerFilter >> reset [
	items := Array new
]
