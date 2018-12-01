Class {
	#name : #WAUnnecessaryWithSentToBrushRule,
	#superclass : #GRSlimeParseTreeLintRule,
	#category : 'Seaside-Slime'
}

{ #category : #running }
WAUnnecessaryWithSentToBrushRule >> checkMethod: aContext [
	aContext isRenderingMethod 
		ifTrue: [ super checkMethod: aContext ]
]

{ #category : #accessing }
WAUnnecessaryWithSentToBrushRule >> group [
	^ 'Seaside'
]

{ #category : #initialization }
WAUnnecessaryWithSentToBrushRule >> initialize [
	super initialize.
	self matcher
		matches: '`html `msg with: ``@arg'
		do: [ :node :answer |
			(answer isNil
				and: [ (node parent isCascade not)
				and: [ (WASlime isBrushSelector: node receiver selector)
				and: [ (WASlime isBrushSelector: node receiver selector , ':')
				and: [ (WASlime isBrushSelector: node methodNode selector) not ] ] ] ])
					ifTrue: [ node ]
					ifFalse: [ answer ] ]
]

{ #category : #accessing }
WAUnnecessaryWithSentToBrushRule >> name [
	^ 'Unnecessary #with: sent to brush'
]

{ #category : #accessing }
WAUnnecessaryWithSentToBrushRule >> rationale [
	^ 'Sending #with: is only required if attributes are specified too.'
]
