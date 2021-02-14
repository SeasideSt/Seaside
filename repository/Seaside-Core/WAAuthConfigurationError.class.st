"
A WAAuthConfigurationError is signaled when no WAAuthConfiguration was added to an application that is behind a WAAuthenticationFilter.
"
Class {
	#name : #WAAuthConfigurationError,
	#superclass : #WAError,
	#category : 'Seaside-Core-Exceptions'
}

{ #category : #accessing }
WAAuthConfigurationError >> seasidePossibleCauses [
	^ #('No WAAuthConfiguration has been added to the application.')
]
