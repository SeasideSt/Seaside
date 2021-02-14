Extension { #name : #WAComponent }

{ #category : #'*Scriptaculous-Components-call/answer' }
WAComponent >> lightbox: aComponent [
	"Display aComponent within a lightbox of the receiver. Note, that this does a full refresh displaying the lightbox. Also note, that this only works well, if you sent to the root component of your application."
	
	^ self wait: [ :cc | 
		self 
			show: aComponent
			onAnswer: cc
			delegation: (SULightbox new
				delegate: aComponent;
				yourself).
		WARenderNotification signal ]
]
