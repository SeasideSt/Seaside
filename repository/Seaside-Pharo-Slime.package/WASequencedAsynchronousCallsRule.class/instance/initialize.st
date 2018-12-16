initialization
initialize
	super initialize.
	self ajaxSelectors do: [ :selector |
		self matcher
			matches: '`@receiver ' , selector , ' `@method: `@arguments' 
			do: [ :node :answer |
				answer isNil
					ifFalse: [ answer ]
					ifTrue: [ 
						| owner |
						owner := node isCascaded
							ifTrue: [ node parent parent ]
							ifFalse: [ node parent ].
						(owner notNil and: [ owner isMessage and: [ owner selector = #, ] ])
							ifTrue: [ owner ] ] ] ]