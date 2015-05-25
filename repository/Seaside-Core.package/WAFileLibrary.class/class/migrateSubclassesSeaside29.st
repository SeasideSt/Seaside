migrating
migrateSubclassesSeaside29
	"migrates all subclasses of the receiver to Seaside 2.9
	you should not send this message to WAFileLibrary because that will also migrate the classes in Seaside"
	self allSubclassesDo: [ :each |
		each migrateToSeaside29 ]