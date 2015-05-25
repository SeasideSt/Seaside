tests
testComprehension
	"What should this print out?

	| yin yang |
	yin := [ :x | Transcript cr. x ] value: Continuation current.
	yang := [ :x | Transcript nextPut: $*. x ] value: Continuation current.
	yin value: yang"