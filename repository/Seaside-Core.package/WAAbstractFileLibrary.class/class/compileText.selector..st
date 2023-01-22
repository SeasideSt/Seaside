private
compileText: aByteArrayOrString selector: aSymbol 
	"Compiles aByteArrayOrString into a method named aSymbol that returns aByteArrayOrString as a string literal."
	| code |
	code := GRPlatform current asMethodReturningString: aByteArrayOrString named: aSymbol.
	GRPlatform current 
		compile: code
		into: self
		classified: self methodCategory