Extension { #name : #Point }

{ #category : #'*Scriptaculous-Core' }
Point >> javascriptOn: aStream [
	aStream nextPut: $[; javascript: self x; nextPut: $,; javascript: self y; nextPut: $]
]
