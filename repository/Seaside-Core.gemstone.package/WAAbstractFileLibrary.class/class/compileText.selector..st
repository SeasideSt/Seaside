private
compileText: aByteArrayOrString selector: aSymbol 
	"Compiles aByteArrayOrString into a method named aSymbol that returns aByteArrayOrString as a string literal.
	aSymbol
		^ aByteArrayOrString"
	| code |
	code := String streamContents: [ :stream | 
		stream
			nextPutAll: aSymbol;
			nextPut: Character cr.
		stream
			tab;
			nextPutAll: '^ '''.
		aByteArrayOrString greaseString do: [ :each | 
			each = $' ifTrue: [ stream nextPut: $' ].
			stream nextPut: each ].
		stream nextPut: $' ].
	GRPlatform current 
		compile: code
		into: self
		classified: self methodCategory