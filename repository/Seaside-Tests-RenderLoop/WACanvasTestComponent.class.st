Class {
	#name : 'WACanvasTestComponent',
	#superclass : 'WAComponent',
	#category : 'Seaside-Tests-RenderLoop',
	#package : 'Seaside-Tests-RenderLoop'
}

{ #category : 'rendering' }
WACanvasTestComponent >> renderContentOn: html [ 
	html paragraph: 'I should be decorated.'
]
