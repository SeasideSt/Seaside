actions
execute
	| aDispatcher |
	aDispatcher := self handler parent.
	aDispatcher unregister: self handler.
	self requestor configure: aDispatcher