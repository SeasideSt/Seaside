accessing
attributes
	^ handler configuration allAttributes collect: 
		[ :each | 
		WAAttributeNode 
			configuration: handler configuration
			attribute: each ]