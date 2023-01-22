converting
responseFor: aZnRequest
	| bufferedStream codecStream |
	bufferedStream := GRPlatform current writeCharacterStreamOn: (self codec encodedStringClass new: 4096).
	codecStream := self codec encoderFor: bufferedStream. 
	^ WAComboResponse
		onBuffered: (GRCountingStream on: codecStream)
		external: aZnRequest stream