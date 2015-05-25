rendering
renderNextButtonOn: html
	html div
		id: uid, '_next';
		style: self buttonStyle;
		class: self cssButton;
		onClick: (html prototype evaluator
					callback: [ :script |
						self scriptMove: -1 for: uid on: script ];
						return: false);
		with: self nextText