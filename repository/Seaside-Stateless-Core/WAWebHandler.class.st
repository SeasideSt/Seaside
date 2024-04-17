Class {
	#name : #WAWebHandler,
	#superclass : #WARestfulCleanHandler,
	#category : #'Seaside-Stateless-Core'
}

{ #category : #accessing }
WAWebHandler >> createCanvasBuilder [
	^ (WAStatelessBuilder on: WAHtmlCanvas)
		rootClass: WAHtmlRoot;
		documentClass: WAHtmlDocument;
		yourself
]

{ #category : #accessing }
WAWebHandler >> renderComponent: component [

	^ self renderComponent: component full: false
]

{ #category : #accessing }
WAWebHandler >> renderComponent: component full: aBoolean [

	^ self createCanvasBuilder
		  fullDocument: aBoolean;
		  rootBlock: [ :root | component updateRoot: root ];
		  render: [ :html | html render: component ]
]

{ #category : #accessing }
WAWebHandler >> renderFragment: component [

	^ self renderComponent: component full: false
]

{ #category : #accessing }
WAWebHandler >> renderPage: component [

	^self renderComponent: component full: true
]
