"
Description
--------------------

I am a controle panel for seaside. I will present to the user the list of adaptors registered in Seaside and let the user do some actions such as:
- Adding a new adaptor
- Removing an adaptor
- Starting an adaptor
- Removing an adaptor
...

Examples
--------------------

	self class open	
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	actionBar:		<aToolbarPresenter>	A toolbar containing actions to execute on the selected adaptor
	adaptors:			<aTablePresenter>		A table providing informations about the registered adaptors
	infos:				<aTextPresenter>		A text giving informations to the user about the selected adaptor

"
Class {
	#name : #WAPharoControlPanel,
	#superclass : #SpPresenter,
	#instVars : [
		'adaptors',
		'actionBar',
		'infos'
	],
	#category : 'Seaside-Pharo-Tools-Spec2'
}

{ #category : #icons }
WAPharoControlPanel class >> adaptorRunningIconContents [
	^ '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
YII='
]

{ #category : #icons }
WAPharoControlPanel class >> adaptorStoppedIconContents [
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABt0lEQVR4XrVTTYtBURgemZp/
ME3zF8zimpSshik2iCmlWIiFhBW5GOUrHyFEp+ZKFkJpkO2sp9nzA5Tt+AHW77zvqZGPoRk1
b51O99z7PO/zvM+5F/9SPp/Pmk6nwev1imcRhMNhViwWAUnWZrP59s8EoiiyWq0GzWYTIpHI
Bx7Jvt8JgnCtUqmeaD9KgCDW6XQ4Ae1o6QXtsEAgsLDZbGAwGECtVktHCaLRaH84HEK9XofJ
ZALdbpcTZbNZcDqdoNfr16jgcQcUCoWsiUSCVavVBQGm0ykwxjbgTCYDlUqF1ABaeN4B48A+
qVur1eKAXq/Hd7KQz+f5oudGowE6ne51eya8UqnUvFwubzy3222QJAnojOJEVdDv9yEWi4FC
obj/0TcO6QHjG+RyuRWRjMdjPgMiI2IiwnekYH6gYK9kyWRyMRqNoFAo8M6DwYCrcDgcYLfb
KYHCyXsQj8dnZIHuQqlUArfbvXS5XODxeMBoNJIKSuHuKAEmMiPJFBt2fcMjOQGwc1Gr1a7o
HhzEuF1+v38WDAZJ7lKj0dzsW8R1edKCxWJ5N5lMa6VSKZz7Q8pxXf3mwy9Px//AHw3xPwAA
AABJRU5ErkJggg=='
]

{ #category : #commands }
WAPharoControlPanel class >> buildCommandsGroupWith: presenter forRoot: aGroup [
	aGroup
		register: (self buildTableMenuFor: presenter);
		register: (self buildToolbarFor: presenter)
]

{ #category : #commands }
WAPharoControlPanel class >> buildTableMenuFor: presenter [
	^ (CmCommandGroup named: 'Table menu') asSpecGroup
		register:
			((CmCommandGroup named: 'Addition and removal') asSpecGroup
				beDisplayedAsGroup;
				register: (WAAddAdaptorCommand forSpecContext: presenter);
				register: (WARemoveAdaptorCommand forSpecContext: presenter);
				yourself);
		register:
			((CmCommandGroup named: 'Encoding') asSpecGroup
				beDisplayedAsGroup;
				register: (WASetAdaptorEncodingCommand forSpecContext: presenter);
				yourself);
		register:
			((CmCommandGroup named: 'Clearing') asSpecGroup
				beDisplayedAsGroup;
				register: (WAClearConfigurationCachesCommand forSpecContext: presenter);
				register: (WAClearSessionsCommand forSpecContext: presenter);
				yourself);
		yourself
]

{ #category : #commands }
WAPharoControlPanel class >> buildToolbarFor: presenter [
	^ (CmCommandGroup named: 'Toolbar') asSpecGroup
		register: (WAAddAdaptorCommand forSpecContext: presenter);
		register: (WAStartAdaptorCommand forSpecContext: presenter);
		register: (WAStopAdaptorCommand forSpecContext: presenter);
		register: (WAInspectAdaptorCommand forSpecContext: presenter);
		register: (WAOpenBrowserCommand forSpecContext: presenter);
		yourself
]

{ #category : #specs }
WAPharoControlPanel class >> defaultSpec [
	^ SpPanedLayout newVertical
		add: #adaptors;
		add:
			(SpBoxLayout newVertical
				add: #actionBar
					expand: false
					fill: false
					padding: 0;
				add: #infos;
				yourself);
		yourself
]

{ #category : #'class initialization' }
WAPharoControlPanel class >> initialize [
	self registerIcons
]

{ #category : #'world menu' }
WAPharoControlPanel class >> menuCommandOn: aBuilder [
	<worldMenu>
	self registerIcons. 
	(aBuilder item: #ServerAdapterBrowser)
		order: 0.21;
		parent: #Tools;
		label: 'Seaside Control Panel';
		icon: (self iconNamed: #adaptorRunningIcon);
		action: [ self open ]
]

{ #category : #'instance creation' }
WAPharoControlPanel class >> open [
	<script>
	self new openWithSpec
]

{ #category : #'class initialization' }
WAPharoControlPanel class >> registerIcons [
	Smalltalk ui icons icons
		at: #adaptorRunningIcon put: (Form fromBinaryStream: (GRPlatform current base64Decode: self adaptorRunningIconContents) asByteArray readStream);
		at: #adaptorStoppedIcon put: (Form fromBinaryStream: (GRPlatform current base64Decode: self adaptorStoppedIconContents) asByteArray readStream)
]

{ #category : #accessing }
WAPharoControlPanel >> currentAdaptors [
	^ WAServerManager default adaptors
]

{ #category : #accessing }
WAPharoControlPanel >> iconForAdaptor: anAdaptor [
	^ self iconNamed: (anAdaptor isRunning ifTrue: [ #adaptorRunningIcon ] ifFalse: [ #adaptorStoppedIcon ])
]

{ #category : #initialization }
WAPharoControlPanel >> initializePresenter [

	adaptors 
		transmitTo: infos 
		transform: [ :adaptor | adaptor ifNil: [ '' ] ifNotNil: [ :a | a controlPanelInfos ] ].

	self updateAdaptorsTable
]

{ #category : #initialization }
WAPharoControlPanel >> initializeWidgets [
	adaptors := self newTable.
	actionBar := (self rootCommandsGroup / 'Toolbar') asToolbarPresenter.
	infos := self newText.
	adaptors
		addColumn:
			((SpImageTableColumn
				title: ''
				evaluated: [ :adaptor | self iconForAdaptor: adaptor ])
				width: 25;
				yourself);
		addColumn:
			(SpStringTableColumn
				title: 'Kind'
				evaluated: [ :adaptor | adaptor class ]);
		addColumn:
			(SpStringTableColumn
				title: 'Port'
				evaluated: [ :adaptor | adaptor port ]);
		addColumn:
			(SpStringTableColumn
				title: 'Status'
				evaluated: [ :adaptor | 
					adaptor isRunning
						ifTrue: [ 'Running' ]
						ifFalse: [ 'Stopped' ] ]);
		contextMenu: [ (self rootCommandsGroup / 'Table menu') beRoot asMenuPresenter ].
	infos disable
]

{ #category : #initialization }
WAPharoControlPanel >> initializeWindow: aWindowPresenter [
	aWindowPresenter
		title: 'Seaside control panel';
		initialExtent: 500 @ 400
]

{ #category : #accessing }
WAPharoControlPanel >> selectedAdaptor [
	^ adaptors selection selectedItem
]

{ #category : #update }
WAPharoControlPanel >> updateAdaptorsTable [
	adaptors
		items: self currentAdaptors;
		selectIndex: 1
]
