actions
login: aString
	"Join the chat-room with the given username aString."
	
	aString isEmptyOrNil ifTrue: [ ^ self ].
	self session username: aString.
	self push: 'event' with: 'joined'