accessing
browserEnvironmentFor: aCollectionOfPackages
	"Answer a browser environment of aCollectionOfPackages."
	
	| browserEnvironmentClass browserEnvironment |
	browserEnvironmentClass := (Smalltalk classNamed: #RBBrowserEnvironment)
		ifNil: [ self error: 'Please install the Smalltalk Refactoring Engine.' ].
	browserEnvironment := browserEnvironmentClass new 
		forPackageNames: (aCollectionOfPackages 
			collect: [ :each | each name ]).
	^ browserEnvironment label: 'Seaside Packages'