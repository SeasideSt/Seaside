Class {
	#name : #WASqueakServerAdaptorBrowser,
	#superclass : #WAServerAdaptorBrowser,
	#category : 'Seaside-Squeak-Tools-OmniBrowser'
}

{ #category : #initialization }
WASqueakServerAdaptorBrowser class >> initialize [
	TheWorldMenu registerOpenCommand: (Array with: 'Seaside Control Panel' with: (Array with: self with: #open))
]

{ #category : #initialization }
WASqueakServerAdaptorBrowser class >> unload [
	TheWorldMenu unregisterOpenCommandWithReceiver: self
]
