initialization
registerForBenchmarking: aComponentClass at: aString
	"registers a counter at '/counter' that is tweaked for benchmarking"
	| application |
	application := (WAAdmin register: aComponentClass asApplicationAt: aString)
		sessionClass: WAPredictableSession; " -> always the same continuation keys"
		preferenceAt: #trackingStrategy put: WACookieOnlySessionTrackingStrategy new; "cookies -> no session in URL"
		yourself.
	"remove the development tools"
	application configuration removeParent: WAAdmin applicationDefaults.
	application configuration addParent: (WAAdmin applicationDefaults copy
		removeParent: WADevelopmentConfiguration instance;
		yourself).
	^ application