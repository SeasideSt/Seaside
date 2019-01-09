operations
performTasks: aCount
	"
	 self performTasks: 0.
	 self performTasks: 1.
	 self performTasks: 60.
	"
	
	self tasks do: [:task | task performTask: aCount ]