actions
clearAllDescriptions
	self allSubclasses do: [ :each | each instance clearDescription ]