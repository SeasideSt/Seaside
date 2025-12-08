"
I simply implemented a handleFiltered method that gets used in the WAGettextExampleSession where the filter is initialized.
"
Class {
	#name : 'WALocalizationContextFilter',
	#superclass : 'WARequestFilter',
	#category : 'Seaside-Gettext-Core',
	#package : 'Seaside-Gettext-Core'
}

{ #category : 'processing' }
WALocalizationContextFilter >> handleFiltered: aRequestContext [ 
	WACurrentLocalizationContext
		use: WALocalizationContext new
		during: [ super handleFiltered: aRequestContext ]
]
