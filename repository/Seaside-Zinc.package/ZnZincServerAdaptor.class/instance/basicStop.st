private
basicStop
	server 
		ifNotNil: [ 
			server stop.
			server := nil ]