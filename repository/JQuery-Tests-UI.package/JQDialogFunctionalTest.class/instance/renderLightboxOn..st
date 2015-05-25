rendering
renderLightboxOn: html
	| id |
	html div
		id: (id := html nextId);
		script: (html jQuery new dialog
			html: JQCounterFunctionalTest new;
			title: 'Lightbox Dialog';
			resizable: false;
			modal: true).
	html submitButton
		onClick: (html jQuery id: id) dialog open;
		with: 'Open Lightbox'