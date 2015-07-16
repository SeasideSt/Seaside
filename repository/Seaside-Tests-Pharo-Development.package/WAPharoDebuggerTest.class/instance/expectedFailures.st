private
expectedFailures
	"The Pharo debugger API is currently broken.
	The Squeak debugger API is not broken
	When it's fixed this test will pass again and we can add temps to the Pharo walkback again."
	Smalltalk at: #SystemVersion ifPresent: [ :systemVersion |
		| versionString |
		versionString := systemVersion current version.
		((versionString beginsWith: 'Pharo') or: [ versionString includesSubString: 'Pharo' ]) ifTrue: [
			"only for Pharo"
			^ #(testNamedTempAt) ] ].
	^ #()