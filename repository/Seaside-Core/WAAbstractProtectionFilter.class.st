"
A protection filter protects the wrapped request handler, mostly useful to protect against session hijacking. See subclasses for different strategies.
"
Class {
	#name : 'WAAbstractProtectionFilter',
	#superclass : 'WARequestFilter',
	#category : 'Seaside-Core-Filter',
	#package : 'Seaside-Core',
	#tag : 'Filter'
}

{ #category : 'testing' }
WAAbstractProtectionFilter class >> isAbstract [ 

	^ self == WAAbstractProtectionFilter
]
