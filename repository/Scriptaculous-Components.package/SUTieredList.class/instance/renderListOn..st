rendering
renderListOn: html
	selectionPath isEmpty
		ifFalse: [ self renderList: (childrenBlock value: selectionPath first) level: 2 on: html ]