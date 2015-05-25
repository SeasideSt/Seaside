actions
execute
	self requestor 
		show: (WADispatcherCopyPage new handler: self handler; yourself)
		onAnswer: [ :newHandler |
			newHandler isNil 
				ifFalse: [ self requestor configure: newHandler ] ]
