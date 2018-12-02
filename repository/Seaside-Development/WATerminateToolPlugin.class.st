"
I try to terminate the process handling this session. This can work of you're at 100% CPU.
"
Class {
	#name : #WATerminateToolPlugin,
	#superclass : #WAToolPlugin,
	#category : 'Seaside-Development-Plugins'
}

{ #category : #testing }
WATerminateToolPlugin >> isActive [
	^ self application preferenceAt: #sessionAllowTermination
]

{ #category : #accessing }
WATerminateToolPlugin >> label [
	^ 'Terminate'
]

{ #category : #accessing }
WATerminateToolPlugin >> priority [
	^ 600
]

{ #category : #rendering }
WATerminateToolPlugin >> renderContentOn: html [
	html anchor
		class: self cssClass;
		url: (html actionUrl
			withField: 'terminate');
		with: self label
]
