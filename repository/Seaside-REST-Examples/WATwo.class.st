"
I am a painter (not a component) that needs no session because I don't send #callback:
"
Class {
	#name : #WATwo,
	#superclass : #WAPainter,
	#category : 'Seaside-REST-Examples'
}

{ #category : #rendering }
WATwo >> renderContentOn: html [
	html heading: 'Two'.
	html anchor
		url: self requestContext request url;
		extraPath: '..';
		extraPath: 'three';
		with: 'three'
]
