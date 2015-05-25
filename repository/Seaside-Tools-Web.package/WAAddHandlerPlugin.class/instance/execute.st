actions
execute
	self requestor 
		show: (WADispatcherAddPage new dispatcher: self requestor dispatcher; yourself)
		onAnswer: [ :newHandler |
			newHandler isNil 
				ifFalse: [ self requestor configure: newHandler ] ]
