private
loggerOn: aScript
	aScript << (logger
		inject: (aScript jQuery: #logger)
		into: [ :result :each | result append: [ :html | html text: each; break ] ]).
	self resetLogger