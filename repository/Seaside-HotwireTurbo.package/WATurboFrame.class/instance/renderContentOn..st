rendering
renderContentOn: html
	"TODO: segment html callbacks with callbacks per turboid"
	(html tag: 'turbo-frame')
		id: self id;
		dataAttributeAt: 'turbo-action' put: 'replace';
		with:[ self renderNextOn: html ]