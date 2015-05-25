initialization
initialize
	super initialize.
	tasks := OrderedCollection new.
	selection := WAValueHolder new.
	tasks add: WADelegationTask new