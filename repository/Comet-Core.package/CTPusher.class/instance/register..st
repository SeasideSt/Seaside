protected
register: aHandler
	"Register a new handler into this pusher."

	mutex critical: [ handlers := handlers copyWith: aHandler ]