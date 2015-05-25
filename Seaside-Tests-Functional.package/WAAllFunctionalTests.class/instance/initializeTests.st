initialization
initializeTests
	classes := (WAPresenter allSubclasses select: [ :each | each isFunctionalTest ])
				asSortedCollection: [ :a :b | a name < b name ].
	current := WAValueHolder with: classes first new