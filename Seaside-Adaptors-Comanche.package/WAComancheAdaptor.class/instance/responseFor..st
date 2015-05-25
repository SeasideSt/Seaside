converting
responseFor: aNativeRequest
	"Answer a response object for aNativeRequest."
	| bufferedStream codecStream |
	bufferedStream := GRPlatform current writeCharacterStreamOn: (String new: 4096).
	codecStream := self codec encoderFor: bufferedStream. 
	^ WAComboResponse
		onBuffered: (GRCountingStream on: codecStream)
		external: aNativeRequest stream