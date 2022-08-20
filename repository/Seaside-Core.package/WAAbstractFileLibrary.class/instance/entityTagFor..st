private
entityTagFor: aStringOrByteArray
	| hash base64 |
	hash := GRPlatform current secureHashFor: aStringOrByteArray.
	"etags have to be delimited by double quotes"
	base64 := GRPlatform current base64Encode: hash.
	^ String new: base64 size + 2 streamContents:  [ :stream |
		stream
			nextPut: $";
			nextPutAll: base64;
			nextPut: $"]