scripting
openOn: aScript hidden: aBoolean
	self isVisible
		ifFalse: [
			visible := true.
			aBoolean ifFalse: [ self showOn: aScript ].
			aScript prototype element
				id: self windowId;
				styleAt: 'left' put: origin x greaseString, 'px';
				styleAt: 'top' put: origin y greaseString, 'px'.
			aScript prototype element
				id: self containerId;
				insert: [ :html |
					self setComponent.
					self renderComponentOn: html ] ]