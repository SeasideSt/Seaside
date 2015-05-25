rendering
renderSelectorsOn: html
	html select
		size: 5;
		selected: selector;
		list: self selectors;
		callback: [ :value | self setSelector: value ];
		onChange: (html scriptaculous updater
			id: 'source';
			triggerForm: 'browser';
			on: #renderSourceOn: of: self)