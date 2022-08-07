exporting
exportRecordHeader: aHeader
	stream 
		nextPutAll: '#: ';
		nextPutAll: aHeader;
		lf.