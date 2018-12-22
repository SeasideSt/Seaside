accessing
sortedWorkingCopies
	^ MCWorkingCopy allManagers asSortedCollection: [ :a :b | a packageName <= b packageName ]