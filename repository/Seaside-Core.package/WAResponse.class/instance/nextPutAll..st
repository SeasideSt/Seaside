streaming
nextPutAll: aStringOrByteArray
	"Append the elements of aStringOrByteArray to the body part of the response."
	
	self stream nextPutAll: aStringOrByteArray