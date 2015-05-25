actions
replaceCache
	self show: WACacheCreator new onAnswer: [ :cache |
		cache notNil ifTrue: [
			self confirm: 'This will clear all existing sessions in the current cache. Are you sure you want to continue?'
				onAnswer: [ :v |
					v ifTrue: [
						self handler cache: cache ] ] ] ]