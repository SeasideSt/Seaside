private
vmOptionsFrom: aSmalltalkImage 
	| options |
	options := ((-1 to: -1000 by: -1)
		collect: [ :each |
			aSmalltalkImage vm getSystemAttribute: each ])
		select: [ :each | each notNil ].
	^ String streamContents: [ :stream | 
		options 
			do: [ :each | stream nextPutAll: each ]
			separatedBy: [ stream space ] ]