Class {
	#name : 'WACallDuringRenderTestComponent',
	#superclass : 'WAComponent',
	#category : 'Seaside-Tests-Flow-Functional',
	#package : 'Seaside-Tests-Flow',
	#tag : 'Functional'
}

{ #category : 'rendering' }
WACallDuringRenderTestComponent >> renderContentOn: html [
	self call: WAMiniCalendar new
]
