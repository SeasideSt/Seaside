development support
releaseDevelopmentVersion: commitMessage
	"Release #development version (set version blessing to #release), update the #development and #stable symbolic versions and save the configuration."

	"self releaseDevelopmentVersion: '- release version 1.0.2'"

	"Note: you need 1.0-beta.28 or later for the class MetacelloToolBox"

	self ensureMetacello.
	(Smalltalk at: #MetacelloToolBox) releaseDevelopmentVersionIn: self description: commitMessage