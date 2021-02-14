Extension { #name : #GRUnsupportedEncodingError }

{ #category : #'*Seaside-Core' }
GRUnsupportedEncodingError >> seasidePossibleCauses [
	^ #(
		'The given encoding name is not supported on this Smalltalk dialect.'
		'The given encoding name is misspelled.'
	)
]
