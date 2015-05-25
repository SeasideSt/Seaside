actions
logout
	"Leave the chat-room."

	self push: 'event' with: 'left'.
	self session username: nil