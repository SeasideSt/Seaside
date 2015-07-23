tools
graphFunctionalDependencies: functionalBool tests: testsBool
	"self graphFunctionalDependencies: true tests: true"

	| packages analyzer |
	packages := self allGRPackages
		collect: [ :each | self packageWithName: each name ].
	testsBool ifFalse: [
		packages := packages reject: [ :each |
			(each packageName indexOfSubCollection: '-Tests-' startingAt: 1) ~= 0 ] ].
	(Smalltalk hasClassNamed: #PDPackageAnalyzer) ifFalse: [ 
		| goferClass |
		goferClass := (Smalltalk classNamed: #Gofer)
			ifNil: [ self error: 'Please install Gofer.' ].
		goferClass new
			renggli: 'packaging';
			package: 'GraphViz';
			package: 'Package-Dependencies';
			load ].
	analyzer := (Smalltalk classNamed: #PDGraphPackageAnalyzer)
		onPackages: packages.
	functionalBool ifTrue: [ 
		GRPackage grPackages 
			do: [ :package | 
				package dependencies do: [ :dep | 
					| source target |
					source := analyzer relation 
						packageNamed: package name
						ifAbsent: [ nil ].
					target := analyzer relation 
						packageNamed: dep name
						ifAbsent: [ nil ].
					(source notNil and: [ target notNil ]) ifTrue: [ 
						source add: ((Smalltalk classNamed: #PDFunctionalDependency) 
							from: source
							to: target) ] ] ]
			displayingProgress: 'Adding functional dependencies' ].
	analyzer save: 'seaside.dot'