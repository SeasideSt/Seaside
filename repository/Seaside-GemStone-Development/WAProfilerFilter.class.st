Class {
	#name : 'WAProfilerFilter',
	#superclass : 'WARequestFilter',
	#instVars : [
		'items'
	],
	#category : 'Seaside-GemStone-Development-Core',
	#package : 'Seaside-GemStone-Development',
	#tag : 'Core'
}

{ #category : 'processing' }
WAProfilerFilter >> handleFiltered: aRequestContext [
	| item |
	item := WAProfilerItem request: aRequestContext request copy.
	[ item profile: [ super handleFiltered: aRequestContext ] ]
		ensure: [ items := items copyWith: item ]
]

{ #category : 'accessing' }
WAProfilerFilter >> items [
	^ items
]

{ #category : 'processing' }
WAProfilerFilter >> reset [
	items := Array new
]
