user interface
addItemToMenu: aMenu
	"Hack. Must nuke the default blankIcon used by OB."

	super addItemToMenu: aMenu.
	self isActive
		ifFalse: [ ^ self ].
	aMenu lastItem icon: nil