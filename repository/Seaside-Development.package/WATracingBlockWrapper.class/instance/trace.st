private
trace

	WACurrentRequestLogContext value ifNotNil: [ :logItem | logItem addBlock: block ]