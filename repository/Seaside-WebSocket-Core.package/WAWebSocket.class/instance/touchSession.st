private
touchSession
	"Prevent session expiry."

	session ifNotNil: [ :s | 
		s application cache at: s key ifAbsent: [ ] ]