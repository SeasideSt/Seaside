rendering-rows
renderRowName: aHandler named: aString on: html
	aHandler isDispatcher
		ifTrue: [
			html anchor
				extraPath: aString;
				callback: [ self dispatcher: aHandler ];
				with: [ html code: aString , '/' ] ]
		ifFalse: [
			html anchor 
				url: aHandler url; 
				with: [ html code: aString ] ]