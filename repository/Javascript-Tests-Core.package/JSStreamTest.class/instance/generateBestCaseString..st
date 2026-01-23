tests-performance
generateBestCaseString: size
	"Generate a String containing only asciii a-z"
	| generator |
	generator := GRPlatform current newRandom.
	^ String streamContents: [:str | 
			1 to: size do:[:i |str nextPut: (Character value: 96 + (generator nextInt: 29)) ] ]