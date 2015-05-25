private
contents
	| stream |
	stream := WriteStream on: String new.
	self response writeOn: stream.
	^ stream contents