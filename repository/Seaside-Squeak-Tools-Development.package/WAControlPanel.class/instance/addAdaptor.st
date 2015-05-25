actions
addAdaptor
	<menuItem: 'Add adaptor...' enabled: true priority: 300 help: 'Add an adaptor to listen on a port'>
	self adaptorClassFromUser ifNotNil: [:cls |
		(self portFromUserFor: cls basicNew) ifNotNil: [:port |
			self updateAfter: [
				| adaptor |
				adaptor := cls port: port greaseInteger.
				(self codecFromUserFor: adaptor) ifNotNil: [:codec |
					adaptor codec: codec]]]]