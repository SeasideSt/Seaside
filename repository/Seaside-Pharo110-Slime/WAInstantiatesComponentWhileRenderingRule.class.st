Class {
	#name : 'WAInstantiatesComponentWhileRenderingRule',
	#superclass : 'GRReSlimeParseTreeLintRule',
	#category : 'Seaside-Pharo110-Slime',
	#package : 'Seaside-Pharo110-Slime'
}

{ #category : 'hooks' }
WAInstantiatesComponentWhileRenderingRule >> afterCheck: aNode mappings: dict [

	| class |
	aNode methodNode compiledMethod isRenderingMethod ifFalse: [ ^ false ].
	class := Smalltalk classNamed: aNode receiver name.
	class ifNil: [ ^ false ].
	^ class isBehavior and: [
		  (WASlime class: class includesBehaviorNamed: #WAPresenter) and: [
			  (WASlime isWithinCallback: aNode) not ] ]
]

{ #category : 'accessing' }
WAInstantiatesComponentWhileRenderingRule >> group [

	^ 'Seaside'
]

{ #category : 'initialization' }
WAInstantiatesComponentWhileRenderingRule >> initialize [

	super initialize.
	self
		matches: '`receiver `@message: ``@args'
]

{ #category : 'accessing' }
WAInstantiatesComponentWhileRenderingRule >> name [

	^ 'Instantiates component while rendering'
]

{ #category : 'accessing' }
WAInstantiatesComponentWhileRenderingRule >> rationale [

	^ 'Components should only be instantiated in initialization-code, callbacks or through lazy initialization.'
]
