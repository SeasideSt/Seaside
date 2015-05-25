running
execute
	"Internal method to start the task running. DO NOT OVERRIDE THIS METHOD! Subclasses
	should implement #go to specify behaviour.
	We used to loop here but no longer need to because the WATaskVisitor will
	rerun any Task that is found not to be delegated."
	
	self answer: self go