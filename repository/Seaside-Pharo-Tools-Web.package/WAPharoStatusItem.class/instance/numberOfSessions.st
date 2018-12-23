private
numberOfSessions
	| count |
	count := 0.
	WASession allSubInstancesDo: [ :each | count := count + 1 ].
	^ count