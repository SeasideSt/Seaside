updating
updateStates: aSnapshot
	"This class is not a Presenter but WAToolDecoration will make sure we get a chance
	to update the snapshot whenever it does."
	
	aSnapshot register: mode