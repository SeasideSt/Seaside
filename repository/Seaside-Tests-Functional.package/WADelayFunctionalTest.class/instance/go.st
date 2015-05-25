actions
go
	self show: (WAComponent new
		addMessage: '3 seconds';
		addDecoration: (WADelayedAnswerDecoration new delay: 3);
		yourself)