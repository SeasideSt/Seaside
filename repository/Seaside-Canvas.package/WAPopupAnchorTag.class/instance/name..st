accessing
name: aString
	"String specifying the name of the new window. If a window with this name already exists, then the new content will be displayed in that existing window, rather than creating a new one."

	self
		greaseDeprecatedApi: 'WAPopupAnchorTag>>#name:'
		details: 'use WAPopupAnchorTag>>#windowTitle: instead.'.
	self windowTitle: aString