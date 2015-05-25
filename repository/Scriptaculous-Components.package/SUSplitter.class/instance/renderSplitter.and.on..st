rendering
renderSplitter: aBeforeItem and: anAfterItem on: html
	html div 
		class: 'handle'; 
		script: (self 
			draggable: aBeforeItem 
			and: anAfterItem
			on: html)