accessing
gofersFor: aCollectionOfPackages
	"Answer a collection of gopher instances of aCollectionOfPackages."
	
	| goferClass repositoryToPackage gofers gofer |
	goferClass := (Smalltalk classNamed: #Gofer)
		ifNil: [ self error: 'Please install Gofer.' ].
	repositoryToPackage := Dictionary new.
	aCollectionOfPackages do: [ :package |
		package url isNil
			ifTrue: [ self error: package name printString, ' has no repository URL' ].
		(repositoryToPackage at: package url ifAbsentPut: [ Set new ])
			add: package name ].
	gofers := OrderedCollection new.
	repositoryToPackage keysAndValuesDo: [ :url :packages |
		gofers add: (gofer := goferClass new url: url).
		packages do: [ :package | gofer package: package ] ].
	^ gofers