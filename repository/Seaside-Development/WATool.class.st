"
A WATool is the common base class for tools called from the development tool bar. Is doesn't do anything but including WADevelopmentFiles.
"
Class {
	#name : #WATool,
	#superclass : #WAComponent,
	#category : 'Seaside-Development-Core'
}

{ #category : #updating }
WATool >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	WAToolFiles default updateRoot: anHtmlRoot.
	WADevelopmentFiles default updateRoot: anHtmlRoot
]
