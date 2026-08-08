monticello
remotePackageChanges: aCollectionOfPackages
	"Display the remote changes of aCollectionOfPackages."
	
	"self remotePackageChanges: self allDirtyPackages"
	"self remotePackageChanges: self allPackages"
	
	| patches |
	patches := OrderedCollection new.
	(self gofersFor: aCollectionOfPackages)
		do: [ :each | patches addAll: each remoteChanges operations ].
	(MCPatch operations: patches)
		browse