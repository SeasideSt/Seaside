"
An short introduction to Seaside
"
Class {
	#name : #WAWelcome,
	#superclass : #WAComponent,
	#instVars : [
		'component'
	],
	#category : 'Seaside-Welcome'
}

{ #category : #accessing }
WAWelcome class >> description [
	^ 'An short introduction to Seaside'
]

{ #category : #initialization }
WAWelcome class >> initialize [
	| application |
	application := WAAdmin register: self asApplicationAt: 'welcome'.
	WAAdmin defaultDispatcher defaultName: 'welcome'.
	application
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDeploymentLibrary;
		addLibrary: JQUiLightnessTheme;
		addLibrary: WAWelcomeFiles;
		scriptGeneratorClass: JQScriptGenerator
]

{ #category : #hooks }
WAWelcome >> children [
	^ Array with: self component
]

{ #category : #accessing }
WAWelcome >> component [
	^ component ifNil: [ component := WAWelcomeGettingStarted new ]

]

{ #category : #rendering }
WAWelcome >> renderContentOn: html [
	html div
		class: 'container';
		with: [
			html div
				class: 'sidebar';
				with: [ self renderSideBarOn: html ].
			html div
				class: 'content';
				with: [ self renderMainContentOn: html ].
			html div class: 'clear' ]
]

{ #category : #rendering }
WAWelcome >> renderHeadingOn: html [
	html div
		class: 'header';
		with: [
			html heading
				level1;
				class: 'welcome';
				with: self title.
			
			html heading
				level2;
				class: 'congrats';
				with: 'Congratulations, you have a working Seaside environment.' ]

]

{ #category : #rendering }
WAWelcome >> renderMainContentOn: html [
	self renderHeadingOn: html.
	html div
		class: 'getting-started';
		with: self component

]

{ #category : #rendering }
WAWelcome >> renderSideBarDivingInOn: html [
	html heading
		level: 3; 
		with: 'Diving In'.
		
	html unorderedList: [
		html listItem: [
			html anchor
				callback: [ self component show: WAWelcomeBrowse new ];
				with: 'Browse'.
			html text: ' the applications installed in your image.' ].
		html listItem: [ 
			html anchor
				callback: [ self component show: WAWelcomeConfigure new ];
				with: 'Configure'.
			html text: ' your Seaside development environment.' ].
		html listItem: [
			html text: 'Check out examples of Seaside''s '.
			html anchor
				url: '/javascript/jquery';
				with: 'JQuery'.
			html text: ' and '.
			html anchor
				url: '/javascript/jquery-ui';
				with: 'JQuery UI'.
			html text: ' integration.' ]. 
		html listItem: [
			html text: 'Seaside 3.2 '.
			html anchor
				url: 'https://github.com/SeasideSt/Seaside/wiki/Seaside320Changelog';
				with: 'changes' ].	
		html listItem: [
			html text: 'Seaside '.
			html anchor
				url: 'https://github.com/SeasideSt/Seaside/wiki/Add-On-Libraries';
				with: 'add-on libraries' ]	]
]

{ #category : #rendering }
WAWelcome >> renderSideBarJoinTheCommunityOn: html [
	html heading
		level: 3; 
		with: 'Join the community'.
		
	html unorderedList: [
		html listItem: [
			html text: 'Join the '.
			html anchor
				url: 'http://lists.squeakfoundation.org/cgi-bin/mailman/listinfo/seaside';
				with: 'mailing list'.
			html text: ' to ask questions and get help.' ] ].

	html form
		action: 'http://www.google.com/search';
		get;
		with: [
			html hiddenInput
				value: 'site:lists.squeakfoundation.org/pipermail/seaside/';
				name: 'q'.
			html textInput
				name: 'q'.
			html submitButton: 'Search'.
			html text: ' the mailing list' ]

]

{ #category : #rendering }
WAWelcome >> renderSideBarOn: html [
	html space.
	html form
		action: 'http://www.google.com/search';
		get;
		with: [
			html hiddenInput
				value: 'site:seaside.st';
				name: 'q'.

			html textInput
				name: 'q'.
			html submitButton: 'Search'.
			html text: ' the Seaside site' ].
	
	self renderSideBarJoinTheCommunityOn: html.
	self renderSideBarDivingInOn: html

]

{ #category : #accessing }
WAWelcome >> title [
	^ 'Welcome to Seaside 3.2'
]

{ #category : #updating }
WAWelcome >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	
	anHtmlRoot title: self title.
	anHtmlRoot link beShortcutIcon; url: WAToolFiles / #faviconIco

]
