Class {
	#name : #WAWelcomeConfigure,
	#superclass : #WAComponent,
	#category : 'Seaside-Welcome'
}

{ #category : #private }
WAWelcomeConfigure >> clearServerUrl [
	WAWelcomeUrlDialog clearServerUrl
]

{ #category : #actions }
WAWelcomeConfigure >> disableErrorWalkbacks [
	WAAdmin applicationExceptionHandlingDefaults at: #exceptionHandler put: WAHtmlErrorHandler
]

{ #category : #actions }
WAWelcomeConfigure >> enableErrorWalkbacks [
	WAAdmin applicationExceptionHandlingDefaults at: #exceptionHandler put: WAWalkbackErrorHandler
]

{ #category : #testing }
WAWelcomeConfigure >> errorWalkbacksEnabled [
	^ (WAAdmin applicationExceptionHandlingDefaults at: #exceptionHandler) = WAWalkbackErrorHandler
]

{ #category : #'rendering-parts' }
WAWelcomeConfigure >> renderButtonsOn: html [
	html div class: 'buttons'; with: [
		html anchor
			url: '/config';
			script: (html jQuery this button
				primaryIcon: 'ui-icon-gear');
			with: 'Advanced Configuration'.
		html anchor
			callback: [ self answer ];
			script: (html jQuery this button
				primaryIcon: 'ui-icon-arrowreturnthick-1-w');
			title: 'Go back';
			with: 'Back' ]
]

{ #category : #rendering }
WAWelcomeConfigure >> renderContentOn: html [
	html form class: 'config'; with: [ 
		html heading: 'Basic Configuration'.
		html anchor
			class: 'goback';
			callback: [ self answer ];
			with: '[ go back ]'.
		self renderDescriptionOn: html.
		self renderToolsOn: html.
		self renderWalkbacksOn: html.
		self renderServerUrlOn: html.
		self renderButtonsOn: html ]
]

{ #category : #'rendering-parts' }
WAWelcomeConfigure >> renderDescriptionOn: html [
	html paragraph: [
		html text: 'Here are a few common settings you might want to change. Once you''re ready for more, you can jump over to the '.
		html anchor
			url: '/config';
			with: 'advanced configuration tool'.
		html text: '.' ]
]

{ #category : #'rendering-parts' }
WAWelcomeConfigure >> renderServerUrlOn: html [
	| id |
	html div
		id: (id := html nextId);
		class: 'dialog';
	      script: (html jQuery new dialog
			html: WAWelcomeUrlDialog new;
			title: 'Configure server URL';
			resizable: false;
			modal: true).
	html paragraph: [
		html text: 'Public server URL: '; text: self serverUrl; text: ' [ '.
		html anchor
			url: '#';
			onClick: ((html jQuery id: id) dialog open return: false);
			with: 'set'.
		self serverUrl isNil ifFalse: [
			html text: ' / '.
			html anchor
				callback: [ self clearServerUrl ];
				with: 'clear' ].
		html text: ' ]' ]
]

{ #category : #'rendering-parts' }
WAWelcomeConfigure >> renderToolsOn: html [
	html paragraph: [
		html checkbox
			id: html nextId;
			value: WAAdmin developmentToolsEnabled;
			onTrue: [ WAAdmin enableDevelopmentTools ]
			onFalse: [ WAAdmin disableDevelopmentTools ];
			onChange: (html jQuery ajax serializeForm).
		html label
			for: html lastId;
			with: 'Show development toolbar' ]
]

{ #category : #'rendering-parts' }
WAWelcomeConfigure >> renderWalkbacksOn: html [
	html paragraph: [
		html checkbox
			id: html nextId;
			value: self errorWalkbacksEnabled;
			onTrue: [ self enableErrorWalkbacks ]
			onFalse: [ self disableErrorWalkbacks ];
			onChange: (html jQuery ajax serializeForm).
		html label
			for: html lastId;
			with: 'Allow debugging of errors' ]
]

{ #category : #private }
WAWelcomeConfigure >> serverUrl [
	^ WAWelcomeUrlDialog serverUrl
]
