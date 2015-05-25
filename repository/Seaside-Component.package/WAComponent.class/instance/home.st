accessing
home
	"Remove all delegations from the receiver, making sure that it is displayed again."
	
	self delegations do: [ :each | self removeDecoration: each ]