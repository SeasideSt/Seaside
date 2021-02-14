Extension { #name : #Color }

{ #category : #'*Javascript-Pharo-Core' }
Color >> javascriptOn: aStream [
	aStream nextPut: $"; nextPut: $#.
	aStream nextPutAll: (((self red * 255) truncated printStringBase: 16)
		padLeftTo: 2 with: $0).
	aStream nextPutAll: (((self green * 255) truncated printStringBase: 16)
		padLeftTo: 2 with: $0).
	aStream nextPutAll: (((self blue * 255) truncated printStringBase: 16)
		padLeftTo: 2 with: $0).
	aStream nextPut: $"
]
