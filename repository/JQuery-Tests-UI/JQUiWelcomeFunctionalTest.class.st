Class {
	#name : #JQUiWelcomeFunctionalTest,
	#superclass : #JQWelcomeFunctionalTest,
	#category : 'JQuery-Tests-UI-Functional'
}

{ #category : #rendering }
JQUiWelcomeFunctionalTest >> renderContentOn: html [
	super renderContentOn: html.
	self renderQueryUiOn: html
]

{ #category : #rendering }
JQUiWelcomeFunctionalTest >> renderQueryUiOn: html [
	html heading level: 4; with: 'jQuery UI'.
	html paragraph: [
		html anchor
			url: 'http://ui.jquery.com/';
			with: 'jQuery UI'.
		html text: ' provides abstractions for low-level interaction and high-level, themeable widgets, built on top of the jQuery JavaScript Library, that you can use to build highly interactive web applications.' ]
]

{ #category : #rendering }
JQUiWelcomeFunctionalTest >> renderWelcomeOn: html [
	html paragraph: [
		html anchor
			url: 'http://www.seaside.st/';
			with: 'Seaside'.
		html text: ' provides a complete integration of '.
		html anchor
			url: 'http://www.jquery.com/';
			with: 'jQuery'.
		html text: ' and '.
		html anchor
			url: 'http://ui.jquery.com/';
			with: 'jQuery UI'.
		html text: ', allowing the use of these libraries without having to write a single line of JavaScript code. Everything can be configured and plugged together using Smalltalk objects. Try by yourself, by clicking through this functional test suite and by browsing the source-code.' ]
]
