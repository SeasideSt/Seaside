private
unwrapPart: aString

	| crlf i j name filename contentType data waFile |
	crlf := Character cr asString , Character lf asString.
	((aString copyFrom: 1 to: 2) = crlf
		and: [(aString copyFrom: 3 to: 40) = 'Content-Disposition: form-data; name="'])
		ifFalse: [
			self error: 'Unexpected multipart data (1): ' , aString printString.
	].
	i := aString indexOf: $" startingAt: 41.
	name := aString copyFrom: 41 to: i - 1.
	((aString copyFrom: i + 1 to: i + 4) = (crlf , crlf) 
		and: [(aString copyFrom: aString size - 1 to: aString size) = crlf]) ifTrue: [
			data := aString copyFrom: i + 5 to: aString size - 2.
			^name -> data.
	].
	((aString copyFrom: i to: i + 12) = '"; filename="' 
		and: [(aString copyFrom: aString size - 1 to: aString size) = crlf]) ifTrue: [ | tokens type subTypes |
			j := aString indexOf: $" startingAt: i + 13.
			filename := self codec url decode: (aString copyFrom: i + 13 to: j - 1).
			filename isEmpty ifTrue: [ ^nil ]. "bug39828"
			((aString copyFrom: j + 1 to: j + 16) = (crlf , 'Content-Type: ') 
				and: [(aString copyFrom: aString size - 1 to: aString size) = crlf]) ifFalse: [
				self error: 'Unexpected multipart data (2): ' , aString printString.
			].
			i := j + 17.
			j := aString indexOf: Character cr startingAt: i.
			contentType := aString copyFrom: i to: j - 1.
			(aString copyFrom: j to: j + 3) = (crlf , crlf) ifFalse: [
				self error: 'Unexpected multipart data (3): ' , aString printString.
			].
			data := aString copyFrom: j + 4 to: aString size - 2.
			tokens := contentType findTokens: '/'.
			type := tokens first.
			subTypes := tokens second findTokens: '+'.
			waFile := WAFile new
				contents: data asByteArray;
				contentType: contentType;
				fileName: filename;
				yourself.
			^name -> waFile.
	].
	self error: 'Unexpected multipart data (4): ' , aString printString.