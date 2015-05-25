rendering
renderFieldForAttribute: anAttribute on: html 
	(self configuration at: anAttribute key) isNil 
		ifTrue:  [
			self 
				visitAttribute: anAttribute
				on: html ]
		ifFalse: [
			(self hasLocalValueForAttribute: anAttribute) 
				ifTrue:  [
					self 
						visitAttribute: anAttribute
						on: html ]
				ifFalse: [
					self 
						renderInheritedAttribute: anAttribute
						on: html ] ].
	self 
		renderActionsForAttribute: anAttribute
		on: html