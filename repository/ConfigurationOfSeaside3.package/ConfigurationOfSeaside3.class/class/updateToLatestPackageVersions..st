development support
updateToLatestPackageVersions: descriptionString
	"Updates mcz file versions in current version"

	"self updateToLatestPackageVersions: ''"

	"Note: you need 1.0-beta.28 or later for the class MetacelloToolBox"

	self ensureMetacello.
	((Smalltalk at: #MetacelloToolBox) updateToLatestPackageVersionsIn: self description: descriptionString) isEmpty
		ifTrue: [ self inform: 'All specs up to date' ]