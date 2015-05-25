rendering
setSelector: selector toInstanceOf: aCachePluginClass 
	| mutator |
	mutator := ('set' , selector asMutator capitalized greaseString) asSymbol.
	self cache 
		perform: mutator
		with: aCachePluginClass new