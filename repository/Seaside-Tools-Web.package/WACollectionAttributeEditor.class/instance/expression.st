accessing
expression
	^ self configuration expressionAt: attribute key ifAbsent: [ nil ]