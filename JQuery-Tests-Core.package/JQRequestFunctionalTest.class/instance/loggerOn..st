private
loggerOn: aScript
	aScript << ((aScript jQuery: #logger) contents remove).
	aScript << (logger
		inject: (aScript jQuery: #logger)
		into: [ :result :each | result append: [ :html | html text: each; break ] ]).
	logger := OrderedCollection new