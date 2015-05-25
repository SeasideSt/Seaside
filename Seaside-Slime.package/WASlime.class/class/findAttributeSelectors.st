private
findAttributeSelectors
	| matcher result |
	matcher := RBParseTreeSearcher new.
	matcher
		matchesAnyOf: #(
			'self addClass: `@value'
			'self addStyle: `@value'
			'self addMedia: `@value'
			'self attributeAt: `@key put: `@value'
			'self attributeAt: `@key ifAbsentPut: `@block'
			'self attributes at: `@key put: `@value'
			'self attributes at: `@key ifAbsentPut: `@block'
			'self attributes at: `@key append: `@value'
			'self attributes at: `@key append: `@value separator: `@separator' )
		do: [ :context :node | true ].
	result := IdentitySet new.
	(self findClasses: #WABrush) , (self findClasses: #WAHtmlElement) do: [ :class | 
		class methodDictionary keysAndValuesDo: [ :selector :method | 
			(matcher executeTree: method parseTree initialAnswer: false) 
				ifTrue: [ result add: selector ] ] ].
	#(callback: enabled: labels:)
		do: [ :each | result add: each ].
	^ result