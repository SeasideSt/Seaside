"
A WAAllocatorStatus displays information about the memory allocator.
"
Class {
	#name : #WAAllocatorStatus,
	#superclass : #WAPharoStatusItem,
	#category : 'Seaside-Pharo-Tools-Web'
}

{ #category : #actions }
WAAllocatorStatus >> editIntegerVMParameterAt: anInteger named: aString [ 
	self 
		request: aString
		default: (SmalltalkImage current vm parameterAt: anInteger)
		onAnswer: [ :value | 
			SmalltalkImage current vm
				parameterAt: anInteger
				put: value greaseInteger ]
]

{ #category : #actions }
WAAllocatorStatus >> editMemoryVMParameterAt: anInteger named: aString [
	self show: ((WAVMParameterEditor paramterIndex: anInteger)
		addMessage: aString;
		yourself)
]

{ #category : #accessing }
WAAllocatorStatus >> label [
	^ 'Allocator'
]

{ #category : #accessing }
WAAllocatorStatus >> priority [
	^ 500
]

{ #category : #rendering }
WAAllocatorStatus >> renderEditIntegerParameterAt: anInteger named: aString on: html [
	| parameter |
	parameter := SmalltalkImage current vm parameterAt: anInteger.
	self
		renderLabel: aString
		value: [
			html render: parameter.
			self
				renderEditVMParameterAt: anInteger
				callback: [ self editIntegerVMParameterAt: anInteger named: aString ]
				on: html ]
		on: html
]

{ #category : #rendering }
WAAllocatorStatus >> renderEditMemoryParameterAt: anInteger named: aString on: html [
	| parameter |
	parameter := SmalltalkImage current vm parameterAt: anInteger.
	self
		renderLabel: aString
		value: [
			html render: (self printMemory: parameter).
			self
				renderEditVMParameterAt: anInteger
				callback: [ self editMemoryVMParameterAt: anInteger named: aString ]
				on: html ]
		on: html
]

{ #category : #rendering }
WAAllocatorStatus >> renderEditVMParameterAt: anInteger callback: aBlock on: html [
	html space.
	html render: $[.
	html anchor
		title: 'edit';
		callback: aBlock;
		with: $e.
	html render: $]
]

{ #category : #rendering }
WAAllocatorStatus >> renderValuesOn: html [
	| parameters |
	parameters := SmalltalkImage current vm getParameters.
	
	self renderLabel: 'Allocation Count' value: (parameters at: 4) on: html.
	self renderEditIntegerParameterAt: 5 named: 'Allocations Between GCs' on: html.
	self renderEditIntegerParameterAt: 6 named: 'Survivor Count Tenuring Threshold' on: html.
	
	self renderEditMemoryParameterAt: 23 named: 'Extra VM Memory' on: html.
	self renderEditMemoryParameterAt: 24 named: 'Shrinking Threshold' on: html.
	self renderEditMemoryParameterAt: 25 named: 'Memory Headroom' on: html.
	
	self renderLabel: 'Grow Memory Requests' value: (parameters at: 31) on: html.
	self renderLabel: 'Shrink Memory Requests' value: (parameters at: 32) on: html.
	
	self renderLabel: 'Objects Pending Finalization' value: (parameters at: 39) on: html.
	
	self renderLabel: 'Root Table Size' value: (parameters at: 21) on: html.
	self renderLabel: 'Root Table Overflows Since Startup' value: (parameters at: 22) on: html
]

{ #category : #accessing }
WAAllocatorStatus >> title [
	^ 'Memory Allocator'
]
