configuration
defaultMetaNode
	| default adaptors |
	default := OBMetaNode named: 'default'.
	adaptors := OBMetaNode named: 'adaptors'.
	adaptors addFilter: WAServerAdaptorStatusFilter new.
	default childAt: #adaptors put: adaptors.
	^ default