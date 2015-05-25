private
compileBinary: aByteArrayOrString selector: aSymbol 
	"compiles aByteArrayOrString into a method named aSymbol that returns aByteArrayOrString as a byte array"
	| code |
	code := GRPlatform current 
		asMethodReturningByteArray: aByteArrayOrString
		named: aSymbol.
	GRPlatform current 
		compile: code
		into: self
		classified: self methodCategory