rendering
renderNavigationOn: html
	"reset offset for each full refresh"
	| theExtent clipExtent |
	offset := 1.
	created := self visibleItems.
	theExtent := self componentExtent.
	clipExtent := self clipExtent.
	html div
		class: self cssClass; 
		style: 'height:', theExtent y greaseString, 'px;width:', theExtent x greaseString ,'px' ;
		with: [
			self renderPreviousButtonOn: html.
			html div
				class: 'clip-region';
				class: self cssFloat;
				style: 'height:', clipExtent y greaseString, 'px;width:', clipExtent x greaseString ,'px' ;
				id: 'clip_', uid;
				with: [ self renderNavElementsOn: html ].
			self renderNextButtonOn: html ]