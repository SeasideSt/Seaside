*seaside-flow
call: aComponent 
	"Pass control from the receiver to aComponent. The receiver will be temporarily replaced with aComponent. Code can return from here later on by sending #answer: to aComponent."

	^ self wait: [ :cc | self call: aComponent onAnswer: cc ]