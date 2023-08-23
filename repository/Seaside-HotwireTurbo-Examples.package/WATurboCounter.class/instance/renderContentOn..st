rendering
renderContentOn: html

	html heading: counter.
	html anchor
		turboCallback: [ self increase ];
		with: '++'.
	html space.
	html anchor
		turboCallback: [ self decrease ];
		with: '--'.
	html space.
	html anchor
		url: 'javascript:{}';
		onClick: ((html jQuery id: #foo) load html:[ :h | h anchor callback: [ ] ]);
		with: 'bla'