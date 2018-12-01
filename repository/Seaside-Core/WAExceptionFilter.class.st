Class {
	#name : #WAExceptionFilter,
	#superclass : #WAConfiguredRequestFilter,
	#category : 'Seaside-Core-Filter'
}

{ #category : #configuration }
WAExceptionFilter >> defaultConfiguration [
	^ WAUserConfiguration new
		addParent: WAExceptionFilterConfiguration instance;
		yourself
]

{ #category : #configuration }
WAExceptionFilter >> exceptionHandler [
	^ self configuration at: #exceptionHandler
]

{ #category : #processing }
WAExceptionFilter >> handleFiltered: aRequestContext [
	| handler |
	handler := self exceptionHandler context: aRequestContext.
	handler handleExceptionsDuring: [
		WACurrentExceptionHandler
			use: handler
			during: [ super handleFiltered: aRequestContext ] ]
		
]

{ #category : #testing }
WAExceptionFilter >> isExceptionFilter [
	^ true
]
