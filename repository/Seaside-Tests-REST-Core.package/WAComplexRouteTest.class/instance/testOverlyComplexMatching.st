tests
testOverlyComplexMatching
	| route arguments |
	route := WAComplexRoute
		method: 'GET'
		selector: #zork
		pattern: '/*first*/[methods.mcz|classes.mcz]'
		arguments: #('first')
		produces: nil
		consumes: nil.
	self assert: (route matchesPath: #('first' 'prefixO' 'zzpostfix' 'methods.mcz')).
	self assert: (route matchesPath: #('methods.mcz')).
	self deny: (route matchesPath: #('first' 'prefixO' 'zzpostfix' 'traits.mcz')).
	arguments := Array new: 1.
	route
		mapArgumentsWithElements: #('first' 'prefixO' 'zzpostfix' 'methods.mcz')
		parameters: Dictionary new
		into: arguments.
	self assert: arguments = #(('first' 'prefixO' 'zzpostfix')).
	arguments := Array new: 1.
	route
		mapArgumentsWithElements: #('methods.mcz')
		parameters: Dictionary new
		into: arguments.
	self assert: arguments = #(()).
	
	route := WAComplexRoute
		method: 'GET'
		selector: #zork
		pattern: '/prefix/*first*/{postfix}/[methods.mcz|classes.mcz]'
		arguments: #('first' 'postfix')
		produces: nil
		consumes: nil.
	self assert: (route matchesPath: #('prefix' 'first' 'prefixO' 'zzpostfix' 'postfix' 'methods.mcz')).
	self assert: (route matchesPath: #('prefix' 'postfix' 'methods.mcz')).
	
	arguments := Array new: 2.
	route
		mapArgumentsWithElements: #('prefix' 'first' 'prefixO' 'zzpostfix' 'postfix' 'methods.mcz')
		parameters: Dictionary new
		into: arguments.
	self assert: arguments = #(('first' 'prefixO' 'zzpostfix') 'postfix').
	arguments := Array new: 2.
	route
		mapArgumentsWithElements: #('prefix' 'postfix' 'methods.mcz')
		parameters: Dictionary new
		into: arguments.
	self assert: arguments = #(() 'postfix')