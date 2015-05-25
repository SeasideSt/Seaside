rendering
renderRowIndent: anObject level: anInteger on: html
	anInteger timesRepeat: [ html div class: 'space' ].
	html div
		class: 'space';
		with: [ 
			(expandableBlock value: anObject) ifTrue: [ 
				html anchor
					class: 'expanded' if: (expanded includes: anObject);
					onClick: ((html prototype evaluator)
						callback: [ :script | self toggle: anObject level: anInteger on: script ];
						return: false) ] ]