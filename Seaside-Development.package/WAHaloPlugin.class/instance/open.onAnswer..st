actions
open: aComponent onAnswer: aBlock
	| component decoration |
	component := self session presenter.
	decoration := component decorations
		detect: [ :each | each isKindOf: WAToolDecoration ]
		ifNone: [ nil ].
	decoration isNil
		ifTrue: [ ^ super open: aComponent onAnswer: aBlock ].
	component removeDecoration: decoration.
	super open: aComponent onAnswer: [ :value |
		component addDecoration: decoration.
		aBlock value: value ]