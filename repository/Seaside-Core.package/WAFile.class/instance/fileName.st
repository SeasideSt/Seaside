accessing
fileName
	"compensate for windows explorer behavior"
	^ self isWindowsPath
		ifTrue: [ fileName copyAfterLast: $\ ]
		ifFalse: [ fileName ]