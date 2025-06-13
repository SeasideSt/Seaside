initialization
initializeTests
	classes := WAHotwiredFunctionalTest allSubclasses asSortedCollection: [ :a :b | a name < b name ].
	current := WAValueHolder with: classes first new