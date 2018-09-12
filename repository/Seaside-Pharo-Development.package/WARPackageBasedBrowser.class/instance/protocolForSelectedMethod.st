accessing
protocolForSelectedMethod
	| selectedMessageName |
	selectedMessageName := self selectedMessageName.
	selectedMessageName isNil ifTrue: [ 
		^ selectedMessageCategory ifNil: [ #'-- all --' ] "AllProtocol defaultName is fucked in Pharo 2.0" ].
	^ (self selectedClass >> selectedMessageName asSymbol) category