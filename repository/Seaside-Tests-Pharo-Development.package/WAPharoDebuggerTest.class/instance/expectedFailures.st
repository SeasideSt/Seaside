accessing
expectedFailures
	"The Pharo debugger API is currently broken.
	The Squeak debugger API is not broken
	When it's fixed this test will pass again and we can add temps to the Pharo walkback again."
	Smalltalk at: #SystemVersion ifPresent: [ :systemVersion |
		| versionString |
		versionString := systemVersion current version.
		(versionString beginsWith: 'Pharo') ifTrue: [
			"only for Pharo"
			^ #(testNamedTempAt) ].
		((versionString beginsWith: 'Squeak')
			and: [ systemVersion current date >= (Date year: 2016 month: 8 day: 23) ]) ifTrue: [
			"only for old Squeak, was fixed in 5.1"
			^ #(testNamedTempAt) ] ].
	^ #()