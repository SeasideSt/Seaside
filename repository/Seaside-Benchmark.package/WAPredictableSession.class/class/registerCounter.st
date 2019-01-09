initialization
registerCounter
	"registers a counter at '/counter' that is tweaked for benchmarking"
	^ self registerForBenchmarking: WACounter at: 'counter'