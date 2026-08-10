rendering
javascriptContentOn: aRenderer
	(aRenderer function: 'd3.select') with: [ 
		aRenderer string: '"#flamegraph"' ].
	(aRenderer function: '.datum') with: [ 
		aRenderer object: [ 
			aRenderer key: 'name' value: 'Object class >> new'.
			aRenderer key: 'value' value: 123 ] ].
	(aRenderer function: '.call') with: [ 
		aRenderer argument: [ 
			 aRenderer function: 'flamegraph' ] ]
	