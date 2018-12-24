initialization
initialize
	super initialize.
	matcher := RBParseTreeSearcher new.
	matcher 
		matches: '[ | `@temps | `@.statements ]'
		do: [ :node :answer | 
			| found |
			found := false.
			(answer isNil and: [ node parent isMessage ]) ifTrue: [
				((self selectors includes: node parent selector) 
					or: [ (WASlime brushSelectors includes: node parent selector)
					or: [ (WASlime attributeSelectors includes: node parent selector)
					or: [ (WASlime callbackSelectors includes: node parent selector) ] ] ]) ifFalse: [
						| dangerousNames |
						dangerousNames := Set new.
						node parent parents do: [ :parent | 
							parent isBlock ifTrue: [ dangerousNames addAll: parent argumentNames ].
							parent isSequence ifTrue: [ dangerousNames addAll: parent temporaryNames ] ].
							(dangerousNames anySatisfy: [ :each | node references: each ]) 
								ifTrue: [ found := true ] ] ].
			found ifTrue: [ node ] ifFalse: [ answer ] ]