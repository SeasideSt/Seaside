rendering
renderContentOn: html
	html heading: counter.
	html anchor
	 	attributeAt: 'data-turbo-action' put: 'replace';
		turbocallback: [ self increase ];
		with: '++'.
	html space.
	html anchor
		attributeAt: 'data-turbo-action' put: 'replace';
		turbocallback: [ self decrease ];
		with: '--'.
	html anchor
		url: 'javascript:{}';
		onClick: ((html jQuery id: #foo) load html:[ :h | h anchor callback: [ ] ]);
		with: 'bla'
		