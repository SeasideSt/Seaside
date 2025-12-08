as yet unclassified
generateWorstCaseString: size
	| generator |
	generator := GRPlatform current newRandom.
	^ String streamContents: [:str | 
				1 to: size do: [:i | str nextPut: (Character value: (generator nextInt: 128)) ] ].