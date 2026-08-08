coverage
commentCoverageFor: aCollectionOfPackage
	"Calculates comment coverage for aCollectionOfPackage, including method extensions. For every package it prints on the transcript:
	
		- the package name
		- number of classes
		- number of commented classes
		- percentage of commented classes
		- number of methods
		- number of commented methods
		- percentage of commented methods
		- lines of code"
		
	"self commentCoverageFor: self allPackages"

	| package allClasses classesCommented allMethods methodsCommented linesOfCode |
	aCollectionOfPackage do: [ :each |
		package := self packageWithName: each name.
		allClasses := classesCommented := 0.
		package classes do: [ :theClass |
			allClasses := allClasses + 1.
			theClass hasComment
				ifTrue: [ classesCommented := classesCommented + 1 ] ].
		allMethods := methodsCommented := linesOfCode := 0.
		package methods do: [ :method |
			allMethods := allMethods + 1.
			linesOfCode := linesOfCode + method compiledMethod linesOfCode.
			(method actualClass firstPrecodeCommentFor: method methodSymbol) isNil
				ifFalse: [ methodsCommented := methodsCommented + 1 ] ].
		Transcript
			show: package packageName; tab;
			show: allClasses; tab;
			show: classesCommented; tab;
			show: (100.0 * classesCommented / (allClasses max: 1) truncateTo: 0.01); tab;
			show: allMethods; tab;
			show: methodsCommented; tab;
			show: (100.0 * methodsCommented / (allMethods max: 1) truncateTo: 0.01); tab;
			show: linesOfCode; cr ]