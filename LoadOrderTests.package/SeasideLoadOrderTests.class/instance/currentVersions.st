accessing
currentVersions
	currentVersions ifNil: [currentVersions := MCWorkingCopy allManagers collect: [:ea |  ea ancestry ancestorString ]].
	^currentVersions