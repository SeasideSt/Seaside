initialization
initialize
	super initialize.
	matcher := RBParseTreeSearcher new.
	matcher 
		matches: '`var'
		do: [ :node :answer | 
			(node isWrite and: [ (WASlime isWithinCallback: node) not ])
				ifTrue: [ answer add: node ].
			answer ]