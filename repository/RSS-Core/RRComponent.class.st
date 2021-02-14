"
Base class for all RSS rendering components. Note that RSS components are stripped down versions of Seaside components. Many things like #call: don't work. Also #initialRequest: and #updateRoot: only get sent to the root component.
"
Class {
	#name : #RRComponent,
	#superclass : #WAPainter,
	#category : 'RSS-Core'
}

{ #category : #testing }
RRComponent class >> canBeRoot [
	^ self name ~= #RRComponent
]

{ #category : #rendering }
RRComponent >> rendererClass [
	^ RRRssRenderCanvas
]

{ #category : #accessing }
RRComponent >> session [
	self shouldNotImplement
]
