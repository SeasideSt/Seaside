accessing
label
	^ target isStreamingUploads
		ifTrue: [ '<on>Stream uploads' ]
		ifFalse: [ '<off>Stream uploads' ]