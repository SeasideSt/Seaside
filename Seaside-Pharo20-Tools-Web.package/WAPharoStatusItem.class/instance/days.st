private
days
	^ GRPluggablePrinter on: 
		[ :duration | 
		| days |
		days := duration days.
		days > 0 
			ifTrue: [ (days pluralize: 'day') , ' ' ]
			ifFalse: [ '' ] ]