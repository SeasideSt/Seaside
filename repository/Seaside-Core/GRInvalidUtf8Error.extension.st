Extension { #name : #GRInvalidUtf8Error }

{ #category : #'*seaside-core' }
GRInvalidUtf8Error >> seasidePossibleCauses [
	^ #('The input is not UTF-8 but some other encoding like ISO-8859-1.')
]
