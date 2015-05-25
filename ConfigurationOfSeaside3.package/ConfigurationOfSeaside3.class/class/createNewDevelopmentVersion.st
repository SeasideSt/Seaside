development support
createNewDevelopmentVersion
	"self createNewDevelopmentVersion"

	"Create a new development version using the #stable version as a model"
	
	"Note: you need 1.0-beta.28 or later for the class MetacelloToolBox"

	self ensureMetacello.
	(Smalltalk at: #MetacelloToolBox) createNewDevelopmentVersionIn: self description: ''