"
I am a spec based toolbar for the Pharo server adapter.
"
Class {
	#name : #WAServerAdapterToolbar,
	#superclass : #ComposableModel,
	#instVars : [
		'startButton',
		'stopButton',
		'browseButton',
		'startAction',
		'stopAction',
		'browseAction'
	],
	#category : 'Seaside-Pharo-Tools-Spec'
}

{ #category : #specs }
WAServerAdapterToolbar class >> defaultSpec [

	<spec>
	^ SpecLayout composed
		newRow: [ :row | 
			row
				add: #(model startButton);
				add: #(model stopButton);
				add: #(model browseButton) ];
		yourself
]

{ #category : #specs }
WAServerAdapterToolbar class >> title [
	^'Server adapter toolbar'
]

{ #category : #actions }
WAServerAdapterToolbar >> browseAdaptor [

	self owner adaptor ifNotNil: [ :adaptor |
		adaptor inspect ]
]

{ #category : #accessing }
WAServerAdapterToolbar >> browseButton [
	^ browseButton
]

{ #category : #initialization }
WAServerAdapterToolbar >> initialize [
	super initialize.
	startAction := [ true ] asValueHolder.
	stopAction := [ true ] asValueHolder.
	browseAction := [ true ] asValueHolder
]

{ #category : #initialization }
WAServerAdapterToolbar >> initializeWidgets [

	self instantiateModels: #(
		startButton ButtonModel
		stopButton ButtonModel
		browseButton ButtonModel).
	
	self registerStartButtonEvents.
	self registerStopButtonEvents.
	self registerBrowseButtonEvents.
	
	self focusOrder 
		add: startButton;
		add: stopButton;
		add: browseButton
	
]

{ #category : #private }
WAServerAdapterToolbar >> registerBrowseButtonEvents [

	browseButton 
		label: 'Browse';
		enabled: true;
		action: [ self browseAdaptor ];
		state: false
]

{ #category : #private }
WAServerAdapterToolbar >> registerStartButtonEvents [

	startButton 
		label: 'Start';
		enabled: true;
		action: [ self startAdaptor ];
		state: false
]

{ #category : #private }
WAServerAdapterToolbar >> registerStopButtonEvents [

	stopButton 
		label: 'Stop';
		enabled: true;
		action: [ self stopAdaptor ];
		state: false
]

{ #category : #actions }
WAServerAdapterToolbar >> startAdaptor [

	self owner startAdaptor
]

{ #category : #accessing }
WAServerAdapterToolbar >> startButton [
	^ startButton
]

{ #category : #actions }
WAServerAdapterToolbar >> stopAdaptor [

	self owner stopAdaptor
]

{ #category : #accessing }
WAServerAdapterToolbar >> stopButton [
	^ stopButton
]
