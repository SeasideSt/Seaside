"
I validate and XHTML page by sending it to the W3C validator. I only work if the website is publically available.
"
Class {
	#name : #WAValidateToolPlugin,
	#superclass : #WAToolPlugin,
	#category : 'Seaside-Development-Plugins'
}

{ #category : #accessing }
WAValidateToolPlugin >> label [
	^ 'XHTML'
]

{ #category : #accessing }
WAValidateToolPlugin >> priority [
	^ 800
]

{ #category : #rendering }
WAValidateToolPlugin >> renderContentOn: html [
	html anchor
		class: self cssClass;
		title: 'Validate XHTML';
		url: 'http://validator.w3.org/check/referer';
		with: self label
]
