private
touchSession
	"Prevent session expiry."

	session ifNotNil: [ :s | 
		Transcript show:'Touch session ', s key;cr.
		s application cache at: s key ifAbsent:[ ] ]