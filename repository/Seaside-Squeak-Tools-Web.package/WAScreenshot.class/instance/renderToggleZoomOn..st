rendering
renderToggleZoomOn: html
	html anchor
		callback: [ self toggleZoom ];
		with: self toggleZoomText