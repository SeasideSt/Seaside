actions
setPortFor: anAdaptor
	
	(self portFromUserFor: anAdaptor) ifNotNil: [:port |
		anAdaptor port: port]