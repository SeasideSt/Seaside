tests
testComplexMatching
	| route arguments |
	route := WAComplexRoute
		method: 'GET'
		selector: #zork
		pattern: '/{first}/prefix{second}/{third}postfix/[methods.mcz|classes.mcz]'
		arguments: #('first' 'second' 'third')
		produces: nil
		consumes: nil.
	self assert: (route matchesPath: #('first' 'prefixO' 'zzpostfix' 'methods.mcz')).
	arguments := Array new: 3.
	route
		mapArgumentsWithElements: #('first' 'prefixO' 'zzpostfix' 'methods.mcz')
		parameters: Dictionary new
		into: arguments.
	self assert: arguments = #('first' 'O' 'zz')