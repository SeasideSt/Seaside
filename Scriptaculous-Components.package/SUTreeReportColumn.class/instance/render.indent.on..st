rendering
render: anObject indent: anInteger on: html
	html div class: 'indent'; with: [
		anInteger timesRepeat: [ html div class: 'block' ].
		html div class: 'block'; with: [
			(owner isExpandable: anObject) ifTrue: [
				html anchor
					class: 'expanded' if: (owner isExpanded: anObject);
					onClick: (html prototype evaluator 
						callback: [ :script | owner toggle: anObject level: anInteger on: script ];
						return: false) ] ].
		html div class: 'text'; with: [ self render: anObject on: html ] ]