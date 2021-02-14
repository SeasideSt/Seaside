Class {
	#name : #ConfigurationOfSeaside3,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : 'ConfigurationOfSeaside3'
}

{ #category : #catalog }
ConfigurationOfSeaside3 class >> catalogChangeLog [
	"Returns a paragraph describing the most important changes in the configuration class."
	^ ''
]

{ #category : #catalog }
ConfigurationOfSeaside3 class >> catalogContactInfo [
	"Returns a paragraph describing contact information such as email, mailing lists and website."
	^ 'See http://github.com/SeasideSt/Seaside'
]

{ #category : #catalog }
ConfigurationOfSeaside3 class >> catalogDescription [
	"Returns a paragraph describing the project"
	^ 'The framework for developing sophisticated web applications in Smalltalk. See http://www.seaside.st'
]

{ #category : #catalog }
ConfigurationOfSeaside3 class >> catalogKeyClassesAndExample [
	"Returns a paragraph or more describing the key classes of your project. You can use Pillar/Pier syntax to layout out the text i.e., ==Code== and - for bullet."
	^ ''
]

{ #category : #catalog }
ConfigurationOfSeaside3 class >> catalogKeywords [
	"Returns an array of symbols"
	^ #(web seaside framework) 
]

{ #category : #private }
ConfigurationOfSeaside3 class >> ensureMetacello [
	"Bootstrap Gofer (if necessary), load latest mcz file for ConfigurationOfMetacello (using old 
	 Gofer API), then load the latest version of Metacello itself."

	Smalltalk at: #MetacelloProject ifAbsent: [ | error |
		"list of repositories to try, in case primary repository is not accessible"
		(Array 
			with: 'http://www.squeaksource.com/MetacelloRepository' 
			with: 'http://seaside.gemstone.com/ss/metacello') do: [:repositoryUrl |
				([
					Smalltalk at: #Gofer ifAbsent: [
					"Current version of Gofer from which to bootstrap - as of 1.0-beta.21"
						self bootstrapPackage: 'Gofer-Core-lr.115' from: repositoryUrl ].
					Smalltalk at: #Gofer ifPresent: [:goferClass | | gofer |
						gofer := goferClass new
							url: repositoryUrl;
							yourself.
						[ gofer addPackage: 'ConfigurationOfMetacello' ] on: Warning do: [:ex | ex resume ].
						gofer load ]]
							on: Error
							do: [ :ex |
								error := ex.
								Transcript 
									cr; 
									show: 'failed ensureMetacello: ';
									show: ex description printString;
									show: '...retrying'.
								"try again"
								ex return: nil ]) ~~ nil
					ifTrue: [
						"load 'default' group of Metacello"
						(Smalltalk at: #ConfigurationOfMetacello) perform: #load.
						^self ]].
		"shouldn't get here unless the load failed ... throw an error"
		self error: 'retry with alternate repository failed: ', error description printString ]
]

{ #category : #testing }
ConfigurationOfSeaside3 class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #testing }
ConfigurationOfSeaside3 class >> lastMetacelloVersionLoad [
	"Answer the last version loaded and the list of packages loaded for that version."

	LastVersionLoad == nil ifTrue: [ LastVersionLoad := nil -> 'default' ].
	^LastVersionLoad
]

{ #category : #testing }
ConfigurationOfSeaside3 class >> metacelloVersion: versionString loads: anArrayOrString [
	"Stash the last version loaded and the list of packages loaded for that version. The list
	 of packages will be used by the tools when doing 'Load Package Version'"

	LastVersionLoad := versionString -> anArrayOrString
]

{ #category : #accessing }
ConfigurationOfSeaside3 class >> project [

	^self new project
]

{ #category : #baselines }
ConfigurationOfSeaside3 >> baseline30: spec [
	<version: '3.3-baseline'>
	spec for: #pharo do: [ 
		spec 
			baseline: 'Seaside3' with: [ spec repository: 'github://SeasideSt/Seaside:master/repository' ];
			import: 'Seaside3'
	]
]

{ #category : #accessing }
ConfigurationOfSeaside3 >> project [

	^ project ifNil: [ | constructor |
		"Bootstrap Metacello if it is not already loaded"
		self class ensureMetacello.
		"Construct Metacello project"
		constructor := (Smalltalk at: #MetacelloVersionConstructor) on: self.
		project := constructor project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #accessing }
ConfigurationOfSeaside3 >> stable: spec [
	<symbolicVersion: #stable>
	spec for: #'pharo5.x' version: '3.3.3'.
	spec for: #'pharo6.x' version: '3.3.3'.
	spec for: #'pharo7.x' version: '3.3.3'.
	spec for: #'pharo8.x' version: '3.3.3'
]

{ #category : #baselines }
ConfigurationOfSeaside3 >> version333: spec [
	<version: '3.3.3' imports: #('3.3-baseline')>
	spec for: #pharo do: [
		]
]
