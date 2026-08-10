rendering
renderGcStats: anItem on: html
	anItem time > 0
		ifTrue: [
			html anchor
				callback: [ message := anItem stats ];
				title: 'GC Stats';
				with: [
					html html: '&#x1F5D1; Stats' ] ]
		ifFalse: [
			"avoid ZeroDivide
			https://github.com/SeasideSt/Seaside/issues/968"
			html html: '&#x1F5D1; Stats' ]