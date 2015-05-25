private
workingCopyFor: aPackage
	^ MCWorkingCopy registry
		detect: [ :each | each packageName = aPackage name ]
		ifNone: [ self error: 'Working copy for ', aPackage name printString, ' not found' ]