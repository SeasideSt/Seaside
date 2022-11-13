instance creation
newFromMOFiles: aCollectionOfMOFiles
	| translator |
	translator := self new.
	aCollectionOfMOFiles do:[ :moFile | 
		translator addMOFile: moFile forLocaleID: moFile localeId ].
	^ translator