private
pathStringUnencodedSize
	| count |
	count := 0.
	path isNil ifFalse: [
		path do: [ :each |
			count := count + each size + 1 ] ].
	(path isNil or: [ path isEmpty or: [ slash ] ])
		ifTrue: [ count := count + 1 ].
	^ count