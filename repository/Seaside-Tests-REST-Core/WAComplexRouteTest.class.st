Class {
	#name : #WAComplexRouteTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-REST-Core'
}

{ #category : #tests }
WAComplexRouteTest >> testComplexMatching [
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
]

{ #category : #tests }
WAComplexRouteTest >> testInstantiation [
	WAUrl absolute: '/{3}/_all_docs?startkey={1}&limit={2}'
]

{ #category : #tests }
WAComplexRouteTest >> testOverlyComplexMatching [
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
]

{ #category : #tests }
WAComplexRouteTest >> testParameterMatchingMixedParameters [
	| route parameters |
	route := WARoute get: '/{1}/_all_docs?rev={2}&uuids=true' selector: #a:b:.
	self deny: (route matchesParameters: Dictionary new).
	parameters := Dictionary new at: 'rev' put: '5'; yourself.
	self deny: (route matchesParameters: parameters).
	parameters at: 'uuids' put: 'true'.
	self assert: (route matchesParameters: parameters).
	parameters at: 'phpsessionid' put: '32432'.
	self deny: (route matchesParameters: Dictionary new).
	parameters removeKey: 'phpsessionid'.
	self assert: (route matchesParameters: parameters).
	parameters at: 'uuids' put: 'false'.
	self deny: (route matchesParameters: parameters)
]

{ #category : #tests }
WAComplexRouteTest >> testParameterMatchingNoParameters [
	| route parameters |
	route := WARoute get: '/{1}/_all_docs' selector: #a:.
	self assert: (route matchesParameters: Dictionary new).
	parameters := Dictionary new at: 'key' put: 'value'; yourself.
	self deny: (route matchesParameters: parameters)
]

{ #category : #tests }
WAComplexRouteTest >> testPathMatching [
	| route |
	route := WARoute get: '/{1}/_all_docs' selector: #a:.
	self deny: (route matchesPath: #('something')).
	self assert: (route matchesPath: #('something' '_all_docs')).
	self deny: (route matchesPath: #('something' 'else')).
	self deny: (route matchesPath: #('something' '_all_docs' 'more')).
	self assert: (route priority = 5)
]
