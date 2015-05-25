private
addPathParameterWithValue: aString to: aUrl
	| path |
	path := aUrl path.
	path isEmpty ifTrue: [
		"hack if path is empty, will result in
		/;_s=1234?_k=5678"
		aUrl addToPath: '' ].
	aUrl addPathParameterAt: path size key: self keyField value: aString