"
Common superclass for Seaside notifications
"
Class {
	#name : 'WANotification',
	#superclass : 'GRNotification',
	#category : 'Seaside-Core-Exceptions',
	#package : 'Seaside-Core',
	#tag : 'Exceptions'
}

{ #category : 'testing' }
WANotification class >> isAbstract [ 

	^ self == WANotification
]
