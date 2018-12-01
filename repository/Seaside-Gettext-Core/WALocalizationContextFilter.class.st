Class {
	#name : #WALocalizationContextFilter,
	#superclass : #WARequestFilter,
	#category : 'Seaside-Gettext-Core'
}

{ #category : #processing }
WALocalizationContextFilter >> handleFiltered: aRequestContext [ 
	WACurrentLocalizationContext
		use: WALocalizationContext new
		during: [ super handleFiltered: aRequestContext ]
]
