Class {
	#name : 'WAFlowDelegationTask',
	#superclass : 'WADelegationTask',
	#category : 'Seaside-Tests-Flow-Functional',
	#package : 'Seaside-Tests-Flow',
	#tag : 'Functional'
}

{ #category : 'running' }
WAFlowDelegationTask >> go [
	self call: component1.
	self call: component2
]
