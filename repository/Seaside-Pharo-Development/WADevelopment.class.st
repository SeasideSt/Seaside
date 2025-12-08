"
A WADevelopment is a collection of convenience methods for dealing with Seaside development in Squeak. This code is not supposed to be ported.
"
Class {
	#name : 'WADevelopment',
	#superclass : 'WAObject',
	#category : 'Seaside-Pharo-Development-Core',
	#package : 'Seaside-Pharo-Development',
	#tag : 'Core'
}

{ #category : 'coverage' }
WADevelopment class >> authorCoverageFor: aCollectionOfPackages [
	"Answer an ordered collection with the percentage of the author coverage within aCollectionOfPackages."
	"self authorCoverageFor: self allPackages"

	| authors |
	authors := Bag new.
	aCollectionOfPackages do: [ :package |
		(Smalltalk
			at: #RPackage ifPresent: [ :rPackage |
				(rPackage organizer packageNamed: package name) methods ]
			ifAbsent: [
				Smalltalk
					at: #PackageInfo ifPresent: [ :packageInfo |
						(packageInfo named: package name) methods]])
			do: [ :method | authors add: (method timeStamp copyUpTo: Character space) ] ].
	^ authors sortedCounts 
		collect: [ :each | each value -> ((100.0 / authors size * each key) roundTo: 0.1) ]
]

{ #category : 'accessing' }
WADevelopment class >> browserEnvironmentFor: aCollectionOfPackages [
	"Answer a browser environment of aCollectionOfPackages."
	
	| browserEnvironmentClass browserEnvironment |
	browserEnvironmentClass := (Smalltalk classNamed: #RBBrowserEnvironment)
		ifNil: [ self error: 'Please install the Smalltalk Refactoring Engine.' ].
	browserEnvironment := browserEnvironmentClass new 
		forPackageNames: (aCollectionOfPackages 
			collect: [ :each | each name ]).
	^ browserEnvironment label: 'Seaside Packages'
]

{ #category : 'monticello' }
WADevelopment class >> cleanupPackages: aCollectionOfPackages [
	"Cleanup the packages of aCollectionOfPackages."

	"self cleanupPackages: self allDirtyPackages"
	"self cleanupPackages: self allPackages"

	(self gofersFor: aCollectionOfPackages)
		do: [ :each | each cleanup ]
]

{ #category : 'coverage' }
WADevelopment class >> commentCoverageFor: aCollectionOfPackage [
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
]

{ #category : 'monticello' }
WADevelopment class >> commitPackages: aCollectionOfPackages [
	"Send changes from aCollectionOfPackages to the configured repository."
	
	"self commitPackages: self allDirtyPackages"
	"self commitPackages: self allPackages"

	(self gofersFor: aCollectionOfPackages)
		do: [ :each | each commit ]
]

{ #category : 'tools' }
WADevelopment class >> enableSeasideCodeCritiques [
	"This script enables/disables relevant code critiques for Seaside development"
	<script>

	| disabledRules |

	disabledRules := {

	}.

	ReRuleManager visibleRuleClasses do: [ :ruleClass |
		ruleClass enabled: (disabledRules includes: ruleClass) not ].
	
	"Ensure some rules do not disappear from Pharo.."
	self assert: ReMultiplePeriodsTerminatingStatementRule enabled
]

{ #category : 'requests' }
WADevelopment class >> ensureAuthorInitials [
	"Makes sure the author initials for the image are set."

	^ self ensureAuthorInitialsWith: [ :question | self request: question ]
]

{ #category : 'requests' }
WADevelopment class >> ensureAuthorInitialsWith: aOneArgumentBlock [
	"Makes sure the author initials for the image are set.
	aOneArgumentBlock is called with a question string as an argument when the initials are not set, it answers the initials"
	
	(Smalltalk version beginsWithSubCollection: 'Pharo')
		ifTrue: [
			"Special Pharo code path to avoid deprecation"
			| author |
			SystemVersion current major >= 13 ifTrue:[ ^ self. "do nothing because Author does not exist anymore" ].
			author := Smalltalk at: #Author ifAbsent: [ nil ].
			author isNil
				ifTrue: [ ^ self error: 'unsupported Pharo version' ].
			author fullNamePerSe isEmptyOrNil
				ifTrue: [ author fullName: (aOneArgumentBlock value: 'Please enter your initials:') ] ]
		ifFalse: [
			| utilies |
			utilies := Smalltalk at: #Utilities.
			utilies authorInitialsPerSe isEmpty ifTrue: [
				utilies setAuthorInitials: (aOneArgumentBlock value: 'Please enter your initials:') ] ]
]

{ #category : 'accessing' }
WADevelopment class >> gofersFor: aCollectionOfPackages [
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
]

{ #category : 'monticello' }
WADevelopment class >> loadPackages: aCollectionOfPackages [
	"Load the latest version of aCollectionOfPackages."

	"self loadPackages: self allDirtyPackages"
	"self loadPackages: self allPackages"

	(self gofersFor: aCollectionOfPackages)
		do: [ :each | each load ]
]

{ #category : 'monticello' }
WADevelopment class >> localPackageChanges: aCollectionOfPackages [
	"Display the local changes of aCollectionOfPackages."
	
	"self localPackageChanges: self allDirtyPackages"
	"self localPackageChanges: self allPackages"
	
	| patches |
	patches := OrderedCollection new.
	(self gofersFor: aCollectionOfPackages)
		do: [ :each | patches addAll: each localChanges operations ].
	(MCPatch operations: patches)
		browse
]

{ #category : 'private' }
WADevelopment class >> packageWithName: aString [
	^ Smalltalk
		at: #RPackage ifPresent: [ :rPackage |
			rPackage organizer packageNamed: aString ]
		ifAbsent: [
			Smalltalk
				at: #PackageInfo ifPresent: [ :packageInfo |
				packageInfo named: aString ] ]
]

{ #category : 'monticello' }
WADevelopment class >> recompilePackages: aCollectionOfPackages [
	"Recompile all packages aCollectionOfPackages."

	"self recompilePackages: self allDirtyPackages"
	"self recompilePackages: self allPackages"

	(self gofersFor: aCollectionOfPackages)
		do: [ :each | each recompile ]
]

{ #category : 'monticello' }
WADevelopment class >> reinitializePackages: aCollectionOfPackages [
	"Reinitializes all packages aCollectionOfPackages."

	"self reinitializePackages: self allDirtyPackages"
	"self reinitializePackages: self allPackages"

	(self gofersFor: aCollectionOfPackages)
		do: [ :each | each reinitialize ]
]

{ #category : 'monticello' }
WADevelopment class >> remotePackageChanges: aCollectionOfPackages [
	"Display the remote changes of aCollectionOfPackages."
	
	"self remotePackageChanges: self allDirtyPackages"
	"self remotePackageChanges: self allPackages"
	
	| patches |
	patches := OrderedCollection new.
	(self gofersFor: aCollectionOfPackages)
		do: [ :each | patches addAll: each remoteChanges operations ].
	(MCPatch operations: patches)
		browse
]

{ #category : 'tools' }
WADevelopment class >> renamePackage: oldPackageName to: newPackageName [
	"self renamePackage: 'Seaside-Squeak-Development-Core' to: 'Seaside-Pharo-Development-Core'"
	
	| oldPackage newPackage oldWorkingCopy newWorkingCopy |
	oldPackage := self packageWithName: oldPackageName.
	newPackage := self packageWithName: newPackageName.
	
	" rename system categories "
	oldPackage systemCategories do: [ :oldCategory |
		| newCategory |
		newCategory := oldCategory allButFirst: oldPackage systemCategoryPrefix size.
		Smalltalk organization renameCategory: oldCategory toBe: newPackage systemCategoryPrefix, newCategory ].
	
	" rename method categories "
	oldPackage extensionClasses do: [ :extensionClass |
		(oldPackage extensionCategoriesForClass: extensionClass) do: [ :oldProtocol |
			| newProtocol |
			newProtocol := oldProtocol allButFirst: oldPackage methodCategoryPrefix size.
			extensionClass organization renameCategory: oldProtocol toBe: newPackage methodCategoryPrefix , newProtocol ] ].
	
	" update monticello packages "
	oldWorkingCopy := MCWorkingCopy forPackage: (MCPackage named: oldPackageName).
	newWorkingCopy := MCWorkingCopy forPackage: (MCPackage named: newPackageName).
	newWorkingCopy repositoryGroup: oldWorkingCopy repositoryGroup; modified: true.
	
	" test is all methos have been caught "
	oldPackage methods isEmpty
		ifTrue: [ oldWorkingCopy unload.
			Smalltalk
				at: #RPackage ifPresent: [ :rPackage |
					rPackage organizer unregisterPackage: oldPackage ]
				ifAbsent: [
					Smalltalk
						at: #PackageOrganizer ifPresent: [ :packageOrganizer |
							packageOrganizer default unregisterPackage: oldPackage ] ] ]
		ifFalse: [ self error: 'Some code entities remain in the old package, please migrate manually.' ]
]

{ #category : 'requests' }
WADevelopment class >> request: aString [
	^ self requestor request: aString
]

{ #category : 'private' }
WADevelopment class >> requestor [
	^ ((Smalltalk hasClassNamed: #UIManager)
		ifTrue: [ (Smalltalk classNamed: #UIManager) default ]
		ifFalse: [
			"can be the case for kernel image"
			Smalltalk classNamed: #FillInTheBlank ])
]

{ #category : 'monticello' }
WADevelopment class >> revertPackages: aCollectionOfPackages [
	"Restore pristine working copies of aCollectionOfPackages."

	"self revertPackages: self allDirtyPackages"
	"self revertPackages: self allPackages"

	(self gofersFor: aCollectionOfPackages)
		do: [ :each | each revert ]
]

{ #category : 'private' }
WADevelopment class >> workingCopyFor: aPackage [
	^ MCWorkingCopy registry
		detect: [ :each | each packageName = aPackage name ]
		ifNone: [ self error: 'Working copy for ', aPackage name printString, ' not found' ]
]
