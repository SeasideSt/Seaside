Class {
	#name : #JQWelcomeFunctionalTest,
	#superclass : #JQFunctionalTest,
	#category : 'JQuery-Tests-Core-Functional'
}

{ #category : #rendering }
JQWelcomeFunctionalTest >> renderContentOn: html [
	self renderWelcomeOn: html.
	self renderSeasideOn: html.
	self renderQueryOn: html
]

{ #category : #rendering }
JQWelcomeFunctionalTest >> renderQueryOn: html [
	html heading level: 4; with: 'jQuery'.
	html paragraph: [
		html anchor
			url: 'http://www.jquery.com/';
			with: 'jQuery'.
		html text: ' is a fast and concise Javascript Library that simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development. jQuery is designed to change the way that you write JavaScript.' ]
]

{ #category : #rendering }
JQWelcomeFunctionalTest >> renderSeasideOn: html [
	html heading level: 4; with: 'Seaside'.
	html paragraph: [
		html anchor
			url: 'http://www.seaside.st/';
			with: 'Seaside'.
		html text: ' is a framework for developing sophisticated web applications in Smalltalk. It provides a layered set of abstractions over HTTP and HTML that let you build highly interactive web applications quickly, reusably and maintainably.' ]
]

{ #category : #rendering }
JQWelcomeFunctionalTest >> renderWelcomeOn: html [
	html paragraph: [
		html anchor
			url: 'http://www.seaside.st/';
			with: 'Seaside'.
		html text: ' provides a complete integration of '.
		html anchor
			url: 'http://www.jquery.com/';
			with: 'jQuery'.
		html text: ', allowing the use of the library without having to write a single line of JavaScript code. Everything can be configured and plugged together using Smalltalk objects. Try by yourself, by clicking through this functional test suite and by browsing the source-code.' ]
]

{ #category : #accessing }
JQWelcomeFunctionalTest >> title [
	^ 'Welcome'
]
