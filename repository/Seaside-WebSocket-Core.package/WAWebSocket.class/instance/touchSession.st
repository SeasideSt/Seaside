private
touchSession
	"Prevent session expiry."

	session ifNotNil: [ :s | s touch ]
