initialization
initialize
	super initialize.
	self matcher 
		matchesAnyOf: #(
			'`html `msg: [ ]'
			'`html `msg: [ `html text: ``@arg ]'
			'`html `msg: [ `html render: ``@arg ]' )
		do: [ :node :answer | 
			(answer isNil and: [ WASlime isBrushSelector: node selector ])
				ifTrue: [ node arguments first ]
				ifFalse: [ answer ] ].
	self matcher 
		matchesAnyOf: #(
			'`html `msg with: [ ]'
			'`html `msg with: [ `html text: ``@arg ]'
			'`html `msg with: [ `html render: ``@arg ]' )
		do: [ :node :answer | 
			(answer isNil and: [ WASlime isBrushSelector: node receiver selector ])
				ifTrue: [ node arguments first ]
				ifFalse: [ answer ] ]