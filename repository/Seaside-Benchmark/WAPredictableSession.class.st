"
A WAPredictableSession has linearly incremented continuation keys. This is unsafe but helpful for testing and benchmarking because it makes recording and replaying session possible because the URLs are always the same.

The benchmarking tool has to support cookies for the sessions. Make sure the benchmarking tool supports redirects, otherwise you'll have to record the action ""pages"" as well.
"
Class {
	#name : #WAPredictableSession,
	#superclass : #WASession,
	#category : 'Seaside-Benchmark'
}

{ #category : #initialization }
WAPredictableSession class >> registerCounter [
	"registers a counter at '/counter' that is tweaked for benchmarking"
	^ self registerForBenchmarking: WACounter at: 'counter'
]

{ #category : #initialization }
WAPredictableSession class >> registerForBenchmarking: aComponentClass at: aString [
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
]

{ #category : #initialization }
WAPredictableSession >> createCache [
	^ WAPredictableCache new
]
