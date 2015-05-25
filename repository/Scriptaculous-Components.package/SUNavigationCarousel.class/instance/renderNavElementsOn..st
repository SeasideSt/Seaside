rendering
renderNavElementsOn: html 
	| moveId |
	moveId := html nextId.
	html div
		class: 'nav';
		with: [
			html div
				style: 'height:' , self innerHeight greaseString , 'px';
				class: 'inner';
				with: [
					html div
						id: moveId;
						class: 'move';
						with: [ 
							items keysAndValuesDo: [ :index :element | 
								self 
									renderElement: element
									index: index
									on: html ] ] ].
			self 
				renderActionsForId: moveId
				on: html ]