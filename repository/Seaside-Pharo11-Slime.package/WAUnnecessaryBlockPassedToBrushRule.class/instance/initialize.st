initialization
initialize

	super initialize.
	self 
		matchesAny: #(
			'`html `msg: [ ]'
			'`html `msg: [ `html text: ``@arg ]'
			'`html `msg: [ `html render: ``@arg ]'
			'`html `msg with: [ ]'
			'`html `msg with: [ `html text: ``@arg ]'
			'`html `msg with: [ `html render: ``@arg ]' )