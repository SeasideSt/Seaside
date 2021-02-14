Class {
	#name : #WASvgFunctionalTest,
	#superclass : #WAFunctionalTest,
	#category : 'Seaside-Tests-Functional'
}

{ #category : #rendering }
WASvgFunctionalTest >> renderContentOn: html [
	html object
		type: 'image/svg+xml' seasideMimeType;
		width: 512;
		height: 512;
		standby: 'loading tiger';
		url: 'http://upload.wikimedia.org/wikipedia/commons/f/fd/Ghostscript_Tiger.svg';
		with: 'Your browser doesn''t support SVG'
]
