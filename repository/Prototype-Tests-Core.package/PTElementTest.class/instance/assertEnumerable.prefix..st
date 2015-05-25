utilities
assertEnumerable: aBlock prefix: aString
	self assert: (aBlock value isKindOf: PTEnumerable).
	self
		assert: (aBlock value allSatisfy: [ :each | each element visible ])
		equals: aString , '.all(function(){return $(arguments[0]).visible()})'.
	self
		assert: (aBlock value anySatisfy: [ :each | each element visible not ])
		equals: aString , '.any(function(){return !$(arguments[0]).visible()})'.
	self
		assert: (aBlock value collect: [ :each | each element up ])
		equals: aString , '.map(function(){return $(arguments[0]).up()})'.
	self
		assert: (aBlock value detect: [ :each | each element empty ])
		equals: aString , '.find(function(){return $(arguments[0]).empty()})'.
	self
		assert: (aBlock value detectMax: [ :each | each element width ])
		equals: aString , '.max(function(){return $(arguments[0]).getWidth()})'.
	self
		assert: (aBlock value detectMin: [ :each | each element height ])
		equals: aString , '.min(function(){return $(arguments[0]).getHeight()})'.
	self
		assert: (aBlock value select: [ :each | each element empty ])
		equals: aString , '.findAll(function(){return $(arguments[0]).empty()})'.
	self
		assert: (aBlock value reject: [ :each | each element empty not ])
		equals: aString , '.reject(function(){return !$(arguments[0]).empty()})'.
	self
		assert: (aBlock value sortBy: [ :each | each element height ])
		equals: aString , '.sortBy(function(){return $(arguments[0]).getHeight()})'.

	self
		assert: (aBlock value grep: '[a-z]+')
		equals: aString , '.grep("[a-z]+")'.
	self
		assert: (aBlock value include: nil)
		equals: aString , '.include(null)'.
	self
		assert: (aBlock value invoke: 'zork')
		equals: aString , '.invoke("zork")'.
	self
		assert: (aBlock value invoke: 'zork' with: 1)
		equals: aString , '.invoke("zork",1)'.
	self
		assert: (aBlock value invoke: 'zork' withAll: #(1 2))
		equals: aString , '.invoke("zork",1,2)'.
	self
		assert: (aBlock value pluck: 'id')
		equals: aString , '.pluck("id")'.
	self
		assert: (aBlock value size)
		equals: aString , '.size()'