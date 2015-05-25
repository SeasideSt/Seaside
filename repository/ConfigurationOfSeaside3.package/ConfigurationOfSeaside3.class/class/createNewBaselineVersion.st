development support
createNewBaselineVersion
	"Create a new baseline version based upon current version's baseline.
	 You should create a new baseline if new packages have been added or dependencies have changed."
	
	"self createNewBaselineVersion"

	"Note: you need 1.0-beta.28 or later for the class MetacelloToolBox"

	| currentVersion existingBaselineVersionString baselineVersionNumber |
	self ensureMetacello.
	currentVersion := self project currentVersion.
	existingBaselineVersionString := currentVersion importedVersions first.
	baselineVersionNumber := existingBaselineVersionString asMetacelloVersionNumber incrementMinorVersionNumber.
	self createNewBaselineVersion: baselineVersionNumber versionString from: existingBaselineVersionString