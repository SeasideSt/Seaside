actions
replaceCache
	self
		confirm: 'This will clear all existing sessions in the current cache. Are you sure you want to continue?'
		onAnswer: [ :answer |
			answer ifTrue: [
				self handler cache: self createCache ] ]