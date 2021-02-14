Extension { #name : #WAExceptionHandler }

{ #category : #'*seaside-gemstone-core' }
WAExceptionHandler >> errorCategoryToCatch [

	^self class exceptionSelector
]

{ #category : #'*seaside-gemstone-core' }
WAExceptionHandler >> errorNumberToCatch [

	^nil
]
