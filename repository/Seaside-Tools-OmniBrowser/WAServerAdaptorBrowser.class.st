"
WAServerAdaptorBrowser is the Seaside Control Panel.

Use it to stop, start, inspect and manage the server instances that are running your Seaside applications. It controls the various types of servers using a standard interface defined by WAServerAdaptor. 
"
Class {
	#name : #WAServerAdaptorBrowser,
	#superclass : #OBBrowser,
	#category : 'Seaside-Tools-OmniBrowser'
}

{ #category : #configuration }
WAServerAdaptorBrowser class >> defaultMetaNode [
	| default adaptors |
	default := OBMetaNode named: 'default'.
	adaptors := OBMetaNode named: 'adaptors'.
	adaptors addFilter: WAServerAdaptorStatusFilter new.
	default childAt: #adaptors put: adaptors.
	^ default
]

{ #category : #configuration }
WAServerAdaptorBrowser class >> defaultRootNode [
	^ WAServerManagerNode on: WAAdmin defaultServerManager
]

{ #category : #configuration }
WAServerAdaptorBrowser class >> menuCommandOn: aBuilder [
	<worldMenu>

	(aBuilder item: self title)
		parent: #Tools;
		icon: (self environment
			at: #OBPolymorphInterface 
			ifPresent: [ :class | class default iconNamed: #seasideAdaptorRunning ]);
		action: [ self open ]
]

{ #category : #configuration }
WAServerAdaptorBrowser class >> paneCount [
	^ 1
]

{ #category : #configuration }
WAServerAdaptorBrowser class >> title [
	^ 'Seaside Control Panel'
]

{ #category : #commands }
WAServerAdaptorBrowser >> cmdAddAdaptor [
	<command>
	
	^ WACmdAddAdaptor
]

{ #category : #commands }
WAServerAdaptorBrowser >> cmdBrowseRequestHandler [
	<command>
	<button: 'Browse'>
	
	^ WACmdBrowseRequestHandler
]

{ #category : #commands }
WAServerAdaptorBrowser >> cmdChangeEncoding [
	<command>
	
	^ WACmdEncodingForAdaptor
]

{ #category : #commands }
WAServerAdaptorBrowser >> cmdChangePort [
	<command>
	
	^ WACmdPortForAdaptor
]

{ #category : #commands }
WAServerAdaptorBrowser >> cmdClearConfigurationCaches [
	<command>
	
	^ WACmdClearConfigurationCaches
]

{ #category : #commands }
WAServerAdaptorBrowser >> cmdClearSessions [
	<command>
	
	^ WACmdClearSessions
]

{ #category : #commands }
WAServerAdaptorBrowser >> cmdInspectAdaptor [
	<command>
	
	^ WACmdInspectAdaptor
]

{ #category : #commands }
WAServerAdaptorBrowser >> cmdModeDebug [
	<command>
	
	^ WACmdModeDebug
]

{ #category : #commands }
WAServerAdaptorBrowser >> cmdModeDeployment [
	<command>
	
	^ WACmdModeDeployment
]

{ #category : #commands }
WAServerAdaptorBrowser >> cmdModeVerbose [
	<command>
	
	^ WACmdModeVerbose
]

{ #category : #commands }
WAServerAdaptorBrowser >> cmdRemoveAdaptor [
	<command>
	
	^ WACmdRemoveAdaptor
]

{ #category : #commands }
WAServerAdaptorBrowser >> cmdStartAdaptor [
	<command>
	<button: 'Start'>
	
	^ WACmdStartAdaptor
]

{ #category : #commands }
WAServerAdaptorBrowser >> cmdStopAdaptor [
	<command>
	<button: 'Stop'>

	^ WACmdStopAdaptor
]

{ #category : #commands }
WAServerAdaptorBrowser >> cmdToggleStreamUploads [
	<command>
	
	^ WACmdToggleStreamUploads
]

{ #category : #commands }
WAServerAdaptorBrowser >> cmdUseNewDispatcher [
	<command>
	
	^ WACmdUseNewDispatcher
]

{ #category : #building }
WAServerAdaptorBrowser >> defaultBackgroundColor [
	^ Color r: 0.212 g: 0.637 b: 1.0
]

{ #category : #building }
WAServerAdaptorBrowser >> initialExtent [
	^ 400 @ 300
]

{ #category : #morphic }
WAServerAdaptorBrowser >> step [
	self announce: (OBChildrenChanged node: self root)
]

{ #category : #morphic }
WAServerAdaptorBrowser >> wantsSteps [
	^ true
]
