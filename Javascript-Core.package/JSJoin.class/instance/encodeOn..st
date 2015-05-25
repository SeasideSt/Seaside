encoding
encodeOn: aDocument
	self collection isEmpty
		ifTrue: [ ^ self encodeEmptyOn: aDocument ].
	self collection size = 1
		ifTrue: [ ^ self encodeElement: self collection first on: aDocument ].
	aDocument nextPut: $[.
	self collection
		do: [ :each | self encodeElement: each on: aDocument ]
		separatedBy: [ aDocument nextPut: $, ].
	aDocument nextPutAll: '].join("&")'