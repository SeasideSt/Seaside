private
commandLineArgumentsFrom: aSmalltalkImage 
	| options |
	options := ((3 to: 1000)
		collect: [ :each |
			aSmalltalkImage getSystemAttribute: each ])
		select: [ :each | each notNil ].
	^ String streamContents: [ :stream | 
		options 
			do: [ :each | stream nextPutAll: each ]
			separatedBy: [ stream space ] ]