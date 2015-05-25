delegation
removeDelegation
	"Goes one decoration back (like home but not as much)."

	self delegations notEmpty ifTrue: [
		self removeDecoration: self delegations first ]