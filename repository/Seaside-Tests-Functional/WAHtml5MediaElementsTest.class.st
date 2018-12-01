Class {
	#name : #WAHtml5MediaElementsTest,
	#superclass : #WAFunctionalTest,
	#category : 'Seaside-Tests-Functional'
}

{ #category : #rendering }
WAHtml5MediaElementsTest >> renderAudioOn: html [
	html heading level2; with: '<audio>'.
	html audio
		url: 'http://upload.wikimedia.org/wikipedia/commons/9/94/Mix.ogg';
		autoplay: true;
		controls: true;
		loop: true;
		preload: true
]

{ #category : #rendering }
WAHtml5MediaElementsTest >> renderContentOn: html [
	self renderVideoOn: html.
	self renderAudioOn: html
]

{ #category : #rendering }
WAHtml5MediaElementsTest >> renderVideoOn: html [
	html heading level2; with: '<video>'.
	html video 
		url: 'http://people.opera.com/howcome/2007/video/A_New_Computer--small.ogg';
		autoplay: true;
		controls: true;
		loop: true;
		preload: true;
		poster: 'http://seaside.st/styles/logo-plain.png';
		width: 360; height: 240;
		with: 'Theora decoder not found'
]
