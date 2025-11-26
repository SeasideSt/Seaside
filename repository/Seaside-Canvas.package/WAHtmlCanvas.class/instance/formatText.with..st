convenience
formatText: aString with: collection
	| stream previousText |
	stream := aString readStream.
	previousText := WriteStream on: String new.
	[ stream atEnd ] whileFalse: [ | currentChar | 
			(currentChar := stream next) = ${
				ifTrue: [ 
					| expression index | 
					expression := stream upTo: $}.
					index := Integer readFrom: expression ifFail: [ expression ].
					self text: previousText contents.
					previousText := WriteStream on: String new.
					self render: (collection at: index) ]
				ifFalse: [
					currentChar = $\
						ifTrue: [ stream atEnd ifFalse: [ previousText nextPut: stream next ] ]
						ifFalse: [ previousText nextPut: currentChar ] ] ].
	self text: previousText contents.