private
findBrushSelectors
	| matcher result |
	matcher := RBParseTreeSearcher new.
	matcher
		matchesAnyMethodOf: #(
			'`selector ^ self tag: `#tag'
			'`selector ^ self brush: `@obj'
			'`selector: `aBlock self `selector with: `aBlock'
			'`selector ^ `class on: self' )
		do: [ :context :node | true ].
	result := IdentitySet new.
	(self findClasses: #WACanvas) do: [ :class | 
		class methodDictionary keysAndValuesDo: [ :selector :method | 
			(matcher executeTree: method parseTree initialAnswer: false) 
				ifTrue: [ result add: selector ] ] ].
	^ result