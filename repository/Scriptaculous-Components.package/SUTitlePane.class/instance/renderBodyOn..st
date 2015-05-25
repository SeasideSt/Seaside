rendering
renderBodyOn: html
	html div
		id: uid;
		class: 'body';
		class: 'closed' if: open not;
		with: [ open ifTrue: [ html render: body ] ]