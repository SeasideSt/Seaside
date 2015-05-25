running
setUp
	super setUp.
	dispatcher := WADispatcher new.
	handler := self newHandler.
	dispatcher register: handler at: self handlerName