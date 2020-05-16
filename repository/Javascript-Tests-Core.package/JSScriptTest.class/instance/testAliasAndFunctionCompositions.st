tests
testAliasAndFunctionCompositions
	| script |
	WAHtmlCanvas builder
		render: [ :html | 
			script := ((html javascript alias: 'externalexpression') call: 'foobar'), 
						 ((html javascript alias: 'internalexpression') asFunction: #(value)) ].
					
	self assert: script equals: 'externalexpression.foobar();function(value){internalexpression}'.
		
	WAHtmlCanvas builder
		render: [ :html | 
			script := ((html javascript alias: 'internalexpression') asFunction: #(value)),
						 (html javascript alias: 'externalexpression') ].
	self assert: script equals: 'function(value){internalexpression};externalexpression'