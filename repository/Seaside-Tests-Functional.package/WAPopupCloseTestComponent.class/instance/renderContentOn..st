rendering
renderContentOn: html
	html anchor
		callback: [ self requestContext closeThisPopup ];
		with: 'Close me'.
	html break.
	html anchor
		callback: [ self requestContext closeThisPopupAndReloadOpener ];
		with: 'Close me and reload opener'