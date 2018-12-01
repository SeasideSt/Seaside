Extension { #name : #Point }

{ #category : #'*scriptaculous-core' }
Point >> javascriptOn: aStream [
	aStream nextPut: $[; javascript: self x; nextPut: $,; javascript: self y; nextPut: $]
]
