"
Description
--------------------

I am an action to update the encoding of the current adaptor.
"
Class {
	#name : #WASetAdaptorEncodingCommand,
	#superclass : #WAControlPanelCommand,
	#category : 'Seaside-Pharo-Tools-Spec2'
}

{ #category : #hooks }
WASetAdaptorEncodingCommand >> canBeRun [
	^ self hasAdaptor
]

{ #category : #hooks }
WASetAdaptorEncodingCommand >> codecs [
	^ GRCodec allCodecs asSortedCollection: #name ascending
]

{ #category : #hooks }
WASetAdaptorEncodingCommand >> execute [
	(UIManager default
		chooseFrom: (self codecs collect: [ :each | each name ])
		values: self codecs
		lines: #()
		title: 'Select encoding' translated) ifNotNil: [ :codec | self adaptor codec: codec ]
]

{ #category : #initialization }
WASetAdaptorEncodingCommand >> initialize [
	super initialize.
	self
		name: 'Set adaptor encoding';
		description: 'Set the codec for an adaptor'
]
