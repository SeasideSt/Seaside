rendering
renderContentOn: html
	html unorderedList
		id: 'evolution';
		class: 'evolutionTree';
		script: (html scriptaculous sortable
			create;
			tree: true;
			onUpdate: (html scriptaculous request
				triggerTree: 'evolution'
				callback: [ :values | tree := values ]));
		with: [ self renderChildren: (self childrenOf: nil) on: html ]