actions
resetAll
	"removes all Seaside sites, run this if you run into trouble creating servers"
	| server toRemove |
	server := SwazooServer singleton.
	toRemove := server allSites select: [ :each |
		each isKindOf: WAPluggableSite ].
	toRemove do: [ :each |
		server removeSite: each ]