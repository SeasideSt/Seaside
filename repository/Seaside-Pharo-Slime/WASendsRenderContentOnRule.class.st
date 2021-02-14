Class {
	#name : #WASendsRenderContentOnRule,
	#superclass : #GRSlimeParseTreeLintRule,
	#category : 'Seaside-Pharo-Slime'
}

{ #category : #accessing }
WASendsRenderContentOnRule >> group [
	^ 'Seaside'
]

{ #category : #initialization }
WASendsRenderContentOnRule >> initialize [
	super initialize.
	self matcher
		matches: '`@object renderContentOn: `@html'
		do: [ :node :answer |
			(answer isNil
				and: [ (node methodNode selector ~= #visitPainter:)
				and: [ (node receiver isVariable and: [ node receiver name = 'super' ]) not ] ])
					ifTrue: [ node ]
					ifFalse: [ answer ] ]
]

{ #category : #accessing }
WASendsRenderContentOnRule >> name [
	^ 'Sends #renderContentOn:'
]

{ #category : #accessing }
WASendsRenderContentOnRule >> rationale [
	^ 'Client code should never send #renderContentOn: directly but only #render:.'
]
