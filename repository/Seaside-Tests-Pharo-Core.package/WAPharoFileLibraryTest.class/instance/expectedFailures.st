testing
expectedFailures
	"Fails in Pharo 10 until https://github.com/svenvc/zinc/issues/86 is part of Pharo 10"
	^ SystemVersion current major = 10
		ifTrue:[ #(#testAddAllFilesIn) ]
		ifFalse: [ #() ]