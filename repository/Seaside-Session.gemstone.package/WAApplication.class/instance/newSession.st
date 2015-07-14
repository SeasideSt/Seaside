private
newSession
	"Create a new session which inherits our configuration."
	^ self sessionClass new
		configuration: (WAUserConfiguration new addParent: self configuration; yourself);
		yourself