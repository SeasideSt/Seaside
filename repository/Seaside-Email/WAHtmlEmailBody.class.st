"
I am an HTML email body.
"
Class {
	#name : #WAHtmlEmailBody,
	#superclass : #WAEmailBody,
	#category : 'Seaside-Email-Base'
}

{ #category : #'instance-creation' }
WAHtmlEmailBody class >> renderingBlock: anHtmlRenderingBlock [
	^ self new renderBlock: anHtmlRenderingBlock
]

{ #category : #accessing }
WAHtmlEmailBody >> contentType [
	^ WAMimeType textHtml
]

{ #category : #testing }
WAHtmlEmailBody >> isHtml [
	^ true
]

{ #category : #initialization }
WAHtmlEmailBody >> renderBlock: anHtmlRenderingBlock [
	self
		contentString:
			(WAHtmlCanvas builder
				fullDocument: true;
				render: anHtmlRenderingBlock)
]

{ #category : #accessing }
WAHtmlEmailBody >> sortOrder [
	^ 2
]
