"
I am a component that is used to render a web page without <html>, <head> or <body> elements.

I do not add any functionality, I only prevent components from being used in pages that have <html>, <head> or <body> elements. It is therefore not required that components subclass me.
"
Class {
	#name : 'WAHeadlessComponent',
	#superclass : 'WAComponent',
	#category : 'Seaside-WebComponents-Core',
	#package : 'Seaside-WebComponents-Core'
}

{ #category : 'updating' }
WAHeadlessComponent >> updateRoot: anHtmlRoot [
	self shouldNotImplement
]
