development support
saveModifiedPackages: commitMessage
	"Save modified mcz files and update the configuration."

	"self saveModifiedPackages: '- fixed bug'"

	"Note: you need 1.0-beta.28 or later for the class MetacelloToolBox"

	self ensureMetacello.
	(Smalltalk at: #MetacelloToolBox) saveModifiedPackagesIn: self description:  commitMessage