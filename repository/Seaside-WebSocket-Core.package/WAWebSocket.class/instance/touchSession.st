private
touchSession
	"Prevent session expiry."

	session ifNotNil: [ :aSession | aSession touch	 ]