decorations
timeout: aDuration 
	"Evaluates the receiver after aDuration."
	self greaseDeprecatedApi: 'JSObject>>#timeout:' details: 'Use #setTimeout: instead.'. 
	self setTimeout: aDuration