rendering
renderContentOn: html

	self renderCodeInputConfigurationOn: html.
	html div
		class: 'row';
		with: [ 
			html div 
				class: 'col s3';
				with: packagesPane.
			html div
				class: 'col s3' ;
				with: classesPane.
			html div
				class: 'col s3' ;
				with: methodcategoriesPane.			
			html div
				class: 'col s3' ;
				with: methodsPane ].
	html div
		class: 'row';
		style: 'margin-bottom: 10px';
		with: [ 
			html div class: 'col s3'; with: [ self renderPackageSearchOn: html ].
			html div class: 'col s3'.
			html div
				class: 'col s3';
				with: [ self renderClassAndInstanceControlsOn: html ].
			html div class: 'col s3' ].
	html div
		class: 'row';
		with: [ 
			html div
				class: 'col s12';
				with: methodEditor ].
	"self renderIdiomorphOn: html."
	html render: (WAWebSocketTurboStreamSource new pusher: self session pusher).