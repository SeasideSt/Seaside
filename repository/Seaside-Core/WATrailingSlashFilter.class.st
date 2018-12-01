"
Enforces a trailing slash on the wrapped request handler.
"
Class {
	#name : #WATrailingSlashFilter,
	#superclass : #WARequestFilter,
	#category : 'Seaside-Core-Filter'
}

{ #category : #processing }
WATrailingSlashFilter >> handleFiltered: aRequestContext [
	(self shouldRedirect: aRequestContext)
		ifFalse: [ super handleFiltered: aRequestContext ]
		ifTrue: [ self redirectWithTrailingSlash: aRequestContext ]
]

{ #category : #processing }
WATrailingSlashFilter >> redirectWithTrailingSlash: aRequestContext [ 
	aRequestContext responseGenerator
		redirectTo: (aRequestContext request url copy
			takeServerParametersFromRequest: aRequestContext request;
			slash: true;
			yourself);
		respond
]

{ #category : #testing }
WATrailingSlashFilter >> shouldRedirect: aRequestContext [
	^ aRequestContext request isGet and: [ aRequestContext request url slash not ]
]
