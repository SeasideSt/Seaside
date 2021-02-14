"
This exception handler returns a simple HTML error message response for Warnings and Errors.

It provides two methods to allow the easy creation of custom error responses:

#titleForException:  - can be used to override the text displayed in the title
#renderContentForException:  - can be used to fully customize the HTML output
"
Class {
	#name : #WAHtmlErrorHandler,
	#superclass : #WAErrorHandler,
	#category : 'Seaside-Environment'
}

{ #category : #actions }
WAHtmlErrorHandler >> handleDefault: anException [
	self requestContext respond: [ :response |
		response
			internalError;
			contentType: (WAMimeType textHtml
				charset: self requestContext charSet;
				yourself);
			nextPutAll: (self rendererClass builder
				fullDocument: true;
				rootBlock: [ :root | self updateHtmlRoot: root forException: anException ];
				render: [ :html | self renderContentForException: anException on: html ]) ]
]

{ #category : #actions }
WAHtmlErrorHandler >> renderContentForException: anException on: html [
	html heading level1; with: anException description.
	html paragraph: 'Your request could not be completed. An exception occurred.'
]

{ #category : #accessing }
WAHtmlErrorHandler >> rendererClass [
	^ WAHtmlCanvas
]

{ #category : #content }
WAHtmlErrorHandler >> titleForException: anException [
	^ anException description
]

{ #category : #content }
WAHtmlErrorHandler >> updateHtmlRoot: anHtmlRoot forException: anException [
	anHtmlRoot title: (self titleForException: anException)
]
