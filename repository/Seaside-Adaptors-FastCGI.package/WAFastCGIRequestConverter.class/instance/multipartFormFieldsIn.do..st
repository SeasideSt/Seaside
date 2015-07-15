private
multipartFormFieldsIn: aFSResponderRole do: aBlock

	| contentType bounds idx contentLength body values boundary stream part |
	contentType := aFSResponderRole params at: 'CONTENT_TYPE' ifAbsent: [''].
	contentLength := aFSResponderRole params  at: 'CONTENT_LENGTH' ifAbsent: ['0'].
	body := aFSResponderRole stdin asString.
	contentLength asNumber = body size ifFalse: [
		self error: 'Expected size: ' , contentLength , '; actual size: ' , body size printString.
	].
	bounds := 'boundary='.
	idx := contentType indexOfSubCollection: bounds.
	boundary := '--' , (contentType copyFrom: idx + bounds size to: contentType size).
	stream := ReadStream on: body.
	(part := stream next: boundary size) = boundary 
		ifFalse: [ self error: 'Expected: ' , boundary , ' Received: ' , part printString ].
	[ stream atEnd not ] whileTrue: [
		part := stream upToAll: boundary.
		(part size <= 4 and: [part beginsWith: '--']) 
			ifFalse: [
				part := self unwrapPart: part.
				part ~~ nil 
					ifTrue: [ aBlock value: part ].
				stream next: boundary size]].