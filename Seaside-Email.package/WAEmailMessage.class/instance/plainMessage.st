private
plainMessage
	^ String
		streamContents: [ :stream | 
			self renderAddress: self from withHeader: 'From: ' on: stream.
			self to do: [ :each |
				self renderAddress: each withHeader: 'To: ' on: stream ].
			self cc do: [ :each |
				self renderAddress: each withHeader: 'Cc: ' on: stream ].
			self bcc do: [ :each |
				self renderAddress: each withHeader: 'Bcc: ' on: stream ].
			stream
				nextPutAll: 'Subject: ';
				nextPutAll: self subject;
				nextPut: Character cr.
			self replyTo isNil ifFalse: [
				self renderAddress: self replyTo withHeader: 'Reply-To: ' on: stream ].
			self headers keysAndValuesDo: [ :key :value | 
				stream
					nextPutAll: key greaseString;
					nextPut: $:;
					nextPut: Character space;
					nextPutAll: value greaseString;
					nextPut: Character cr ].
			stream nextPut: Character cr.	"let body start"
			self writeBodyOn: stream ]