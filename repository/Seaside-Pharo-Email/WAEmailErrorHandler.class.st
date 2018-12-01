"
A WAEmailErrorHandler is an error handler that sends out email messages with the stack strace. This is an abstract class that has to be subclassed. Subclasses must override #to and #from that return an instance of WAEmailAddress. It's also recommened to override #handleDefault: to generate a custom HTML response.

"
Class {
	#name : #WAEmailErrorHandler,
	#superclass : #WAErrorHandler,
	#category : 'Seaside-Pharo-Email'
}

{ #category : #private }
WAEmailErrorHandler >> bodyFor: anError [
	^ WAStringEmailBody
		string: (String streamContents: [ :stream | 
			anError signalerContext errorReportOn: stream ])
		lineLength: 72
]

{ #category : #private }
WAEmailErrorHandler >> from [
	"ansers the WAEmailAddress instance used as a sender address"
	self subclassResponsibility
]

{ #category : #actions }
WAEmailErrorHandler >> handleError: anException [
	self sendFailFor: anException.
	^ super handleError: anException
]

{ #category : #private }
WAEmailErrorHandler >> sendFailFor: anError [
	| message |
	message := WAEmailMessage
		from: self from
		to: self to
		subject: (self subjectFor: anError).
	message body: (self bodyFor: anError).
	message send
]

{ #category : #private }
WAEmailErrorHandler >> subjectFor: anError [
	^ anError signalerContext printString
]

{ #category : #private }
WAEmailErrorHandler >> to [
	"answers the WAEmailAddress instance to which the error mail should be sent"
	self subclassResponsibility
]
