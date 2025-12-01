Class {
	#name : 'WASendsRenderContentOnRule',
	#superclass : 'GRReSlimeParseTreeLintRule',
	#category : 'Seaside-Pharo110-Slime',
	#package : 'Seaside-Pharo110-Slime'
}

{ #category : 'hooks' }
WASendsRenderContentOnRule >> afterCheck: aNode mappings: dict [

	aNode methodNode selector = #visitPainter ifTrue: [ ^ false ].
	
	^ (aNode receiver isVariable and: [ aNode receiver name = 'super' ]) not
]

{ #category : 'accessing' }
WASendsRenderContentOnRule >> group [

	^ 'Seaside'
]

{ #category : 'initialization' }
WASendsRenderContentOnRule >> initialize [

	super initialize.
	self
		matches: '`@object renderContentOn: `@html'
]

{ #category : 'accessing' }
WASendsRenderContentOnRule >> name [

	^ 'Sends #renderContentOn:'
]

{ #category : 'accessing' }
WASendsRenderContentOnRule >> rationale [

	^ 'Client code should never send #renderContentOn: directly but only #render:.'
]
