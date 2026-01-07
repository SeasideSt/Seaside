Class {
	#name : 'WAExceptionFilterConfiguration',
	#superclass : 'WASystemConfiguration',
	#category : 'Seaside-Core-Filter',
	#package : 'Seaside-Core',
	#tag : 'Filter'
}

{ #category : 'description' }
WAExceptionFilterConfiguration >> describeOn: config [
	(config list: #exceptionHandler)
		options: [ self exceptionHandlerClasses ];
		default: WAErrorHandler
]

{ #category : 'description' }
WAExceptionFilterConfiguration >> exceptionHandlerClasses [
	^ WAExceptionHandler withAllSubclasses asSortedCollection: [ :a :b | a name <= b name ]
]
