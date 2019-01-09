actions
addHandler: type inDispatcher: aWADispatcher

	(UIManager default request: 'Entry point name:') ifNotNil: [:name |
		name ifNotEmpty: [ | newHandler |
			newHandler := WAAdmin register: type at: name in: aWADispatcher.
			newHandler isApplication ifTrue: [
				WAAdmin configureNewApplication: newHandler].
			self changed: #rootHandlers.
			self handler: newHandler]].
