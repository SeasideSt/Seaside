accessing
response
	^ super response ifNil: [ response := WAStreamedResponse on: (WriteStream on: String new) ]