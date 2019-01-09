icons
seasideAdaptorRunningIcon
	^ Icons
			at: #'seasideAdaptorRunningIcon'
			ifAbsentPut:[ Form fromBinaryStream:self seasideAdaptorRunningIconContents readStream ].
	