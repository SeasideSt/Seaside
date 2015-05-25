rendering
renderBodyOn: html
	html div
		class: 'title';
		id: self titleId;
		with: [ self renderTitleOn: html ].
	html div
		class: 'container';
		style: self cssContainerExtent;
		id: self containerId
