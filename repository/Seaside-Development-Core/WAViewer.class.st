Class {
	#name : #WAViewer,
	#superclass : #WALabelledFormDialog,
	#instVars : [
		'presenter'
	],
	#category : 'Seaside-Development-Core'
}

{ #category : #'instance creation' }
WAViewer class >> on: aPresenter [
	^ self new presenter: aPresenter
]

{ #category : #accessing }
WAViewer >> buttons [
	^ #(save)
]

{ #category : #actions }
WAViewer >> compile: aString [ 
	GRPlatform current 
		compile: aString
		into: presenter class
		classified: #rendering
]

{ #category : #accessing }
WAViewer >> model [
	^ presenter
]

{ #category : #accessing }
WAViewer >> presenter: aPresenter [
	presenter := aPresenter
]

{ #category : #rendering }
WAViewer >> renderContentOn: html [ 
	html heading
		level3;
		with: presenter greaseString.
	super renderContentOn: html
]

{ #category : #rendering }
WAViewer >> renderCssOn: html [
	html textArea
		rows: 20;
		columns: 80;
		value: presenter style;
		callback: [ :css |
			self compile: 'style ', GRPlatform current newline,
				'	^ ', css printString ]
]

{ #category : #accessing }
WAViewer >> rows [
	^ #(css)
]

{ #category : #actions }
WAViewer >> save [
]
