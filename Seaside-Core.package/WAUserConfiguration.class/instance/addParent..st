ancestry
addParent: aConfiguration
	(self parents includes: aConfiguration)
		ifTrue: [ ^ aConfiguration ].
	(self canAddParent: aConfiguration) 
		ifTrue: [ self clearSearchContexts. parents add: aConfiguration ]
		ifFalse: [ WAConfigurationError signal: 'Cannot add this configuration as a parent. Would this cause a circular ancestry graph?' ].
	^ aConfiguration