private - encoding
flushBufferWhenNeeded
	"Writes the contents of the buffer to the stream when it can be decided that encoding the $< as \x3C should happen or not."

	| contentsOfBuffer |
	contentsOfBuffer := String withAll: (buffer copyFrom: 1 to: offset - 1).
	(#('<!--' '<script' '</script') anySatisfy: [ :toBeEncoded | toBeEncoded greaseBeginsWith: contentsOfBuffer ])
		ifTrue:[
			"Encode the $< and flush the buffer to the stream if we have written one of the given character sequences completely.
			Otherwise, continue buffering."
			(#('<!--' '<script' '</script') detect: [ :toBeEncoded | toBeEncoded = contentsOfBuffer ] ifNone: [ nil ])
				isNil ifFalse:[
					stream nextPutAll: '\x3C'.
					stream greaseNext: contentsOfBuffer size - 1 putAll: contentsOfBuffer startingAt: 2.
					offset := 1 ].
			^ self ].
	"We are not buffering any of the given character sequences, so flush the buffer to the stream and apply regular encoding."
	self flushBuffer