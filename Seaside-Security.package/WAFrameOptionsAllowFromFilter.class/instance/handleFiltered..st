processing
handleFiltered: aRequestContext
	| origin |
	origin := self origin.
	origin isEmptyOrNil ifFalse: [
		aRequestContext response frameOptions: 'ALLOW FROM ', origin ].
	super handleFiltered: aRequestContext