private
newHandler
	| child |
	child := WADispatcher new.
	child
		register: WARequestHandler new at: 'foo';
		register: (WADispatcher new
					register: WARequestHandler new at: 'baz';
					yourself) at: 'bar'.
	^ child