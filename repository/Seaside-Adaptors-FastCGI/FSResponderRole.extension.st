Extension { #name : #FSResponderRole }

{ #category : #'*seaside-adaptors-fastcgi' }
FSResponderRole >> url [

	^self params at: 'REQUEST_URI'.
]
