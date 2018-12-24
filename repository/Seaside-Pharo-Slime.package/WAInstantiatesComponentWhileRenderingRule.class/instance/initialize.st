initialization
initialize
	super initialize.
	matcher := RBParseTreeSearcher new.
	matcher 
		matches: '`receiver `@message: ``@args'
		do: [ :node :answer |
			| class |
			((class := Smalltalk classNamed: node receiver name) notNil and: [ class isBehavior and: [ (WASlime class: class includesBehaviorNamed: #WAPresenter) and: [ (WASlime isWithinCallback: node) not ] ] ])
				ifTrue: [ answer add: node ].
			answer ]