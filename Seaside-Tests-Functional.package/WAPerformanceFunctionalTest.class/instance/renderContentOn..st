rendering
renderContentOn: html 
	duration := 0.
	referenceDict ifNil: [ referenceDict := self class referenceDict ].
	self renderExplanationOn: html.
	self renderAnchorsOn: html.
	self renderScriptOn: html.
	self renderTableOn: html.
	self renderLineBreaksOn: html.
	self renderCallbackOn: html.
	self renderFormOn: html.
	self renderIdTestOn: html.
	self renderTextOn: html.
	self renderHtmlTextOn: html.
	self renderBreakOn: html.
	self renderNativeBreakOn: html.
	html div
		class: 'result';
		with: 'Seaside Performance Index: ' , duration greaseString