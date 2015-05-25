icons
seasideAdaptorStoppedIcon
	^ Icons
			at: #'seasideAdaptorStoppedIcon'
			ifAbsentPut:[ Form fromBinaryStream: self seasideAdaptorStoppedIconContents readStream].
	