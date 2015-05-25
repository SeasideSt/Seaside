updating
updateStates: aSnapshot
	"This method allows to register objects for backtracking. Don't forget to send super in all cases."

	self states do: [ :each | aSnapshot register: each ]