Class {
	#name : #WACallDuringRenderTestComponent,
	#superclass : #WAComponent,
	#category : 'Seaside-Tests-Flow-Functional'
}

{ #category : #rendering }
WACallDuringRenderTestComponent >> renderContentOn: html [
	self call: WAMiniCalendar new
]
