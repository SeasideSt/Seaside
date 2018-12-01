Class {
	#name : #WAComponentCallTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-Flow-Unit'
}

{ #category : #tests }
WAComponentCallTest >> testCallSelf [

	| component callback |
	component := WAComponent new.
	callback :=  WAActionCallback new block: [ component call: component ]; yourself.
	self
		should: [ 
			[ callback evaluateWithArgument: nil ] on: WARenderNotification do: [ :e | nil ] ]
		raise: WAError
]
