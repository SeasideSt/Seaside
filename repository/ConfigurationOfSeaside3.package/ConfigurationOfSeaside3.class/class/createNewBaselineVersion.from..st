development support
createNewBaselineVersion: baselineVersionString from: oldBaselineVersionString
	"Seaside30 baseline is made up from two baseline methods, a commonBaseline and the baseline.
	 This method creates new baseline methods"

	"self createNewBaselineVersion: '3.0.4-baseline' from: '3.0.3-baseline'"

	"Note: you need 1.0-beta.28 or later for the class MetacelloToolBox"

	| oldBaselineVersion oldCommonBaselineVersion commonBaselineVersionString |
	self ensureMetacello.
	oldBaselineVersion := self project version: oldBaselineVersionString.
	oldCommonBaselineVersion := self project version: oldBaselineVersion importedVersions first.
	commonBaselineVersionString := baselineVersionString , '-commonBaseline'.
	(Smalltalk at: #MetacelloToolBox)
		halt createBaseline: commonBaselineVersionString
		for: self name asString
		from: oldCommonBaselineVersion versionString
		description: ''.
	(Smalltalk at: #MetacelloToolBox)
		createBaseline: baselineVersionString
		for: self name asString
		from: oldBaselineVersionString
		description: ''.
	((Smalltalk at: #MetacelloToolBox) configurationNamed: self name asString)
		modifyVersionMethodForVersion: baselineVersionString;
		imports: {commonBaselineVersionString};
		commitMethod