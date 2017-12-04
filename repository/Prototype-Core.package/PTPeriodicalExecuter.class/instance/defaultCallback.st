private
defaultCallback
	| stream |
	stream := JSStream new.
	self owner javascriptContentOn: stream.
	^ stream asFunction