"
A WAOperatingSystemStatus displays information about the operating system the virtual machine of this image runs on.
"
Class {
	#name : #WAOperatingSystemStatus,
	#superclass : #WAPharoStatusItem,
	#category : 'Seaside-Pharo-Tools-Web'
}

{ #category : #accessing }
WAOperatingSystemStatus >> label [
	^ 'OS'
]

{ #category : #accessing }
WAOperatingSystemStatus >> priority [
	^ 900
]

{ #category : #rendering }
WAOperatingSystemStatus >> renderValuesOn: html [
	self renderLabel: 'Operating System' value: (self image vm getSystemAttribute: 1001) on: html.
	self renderLabel: 'Version' value: (self image vm getSystemAttribute: 1002) on: html.
	self renderLabel: 'Processor Type' value: (self image vm getSystemAttribute: 1003) on: html
]

{ #category : #accessing }
WAOperatingSystemStatus >> title [
	^ 'Operating System'
]
