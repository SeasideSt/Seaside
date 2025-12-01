"
Common superclass for Seaside errors
"
Class {
	#name : 'WAError',
	#superclass : 'GRError',
	#category : 'Seaside-Core-Exceptions',
	#package : 'Seaside-Core',
	#tag : 'Exceptions'
}

{ #category : 'testing' }
WAError class >> isAbstract [ 

	^ self == WAError
]
