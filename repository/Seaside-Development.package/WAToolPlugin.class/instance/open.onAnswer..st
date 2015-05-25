actions
open: aComponent onAnswer: aBlock
	| component |
	component := self requestor decoratedComponent.
	component removeDecoration: self requestor.
	super open: aComponent onAnswer: [ :value |
		component addDecoration: self requestor.
		aBlock value: value ]