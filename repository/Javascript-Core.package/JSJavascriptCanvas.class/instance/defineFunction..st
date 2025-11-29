public
defineFunction: aBlock
	^ (self brush: (JSJavascriptFunctionDefinitionBrush new)) with: aBlock