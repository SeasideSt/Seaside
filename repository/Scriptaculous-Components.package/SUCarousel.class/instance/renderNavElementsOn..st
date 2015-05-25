rendering
renderNavElementsOn: html 
	html div
		class: self cssOrientation;
		id: uid;
		with: [ 
			self visibleItems keysAndValuesDo: [ :index :element | 
				self 
					renderElement: element
					index: index
					on: html ] ]