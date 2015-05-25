tests-adding
testAddPathParameter
	url addAllToPath: #('seaside' 'files' 'WAStandardFiles' 'seaside.jpg' ).
	url addField: 'redirectcounter' value: 1.
	url addPathParameterAt: 2 key: 'old'.
	url addPathParameterAt: 3 key: 'key1' value: 'value1'.
	url addPathParameterAt: 3 key: 'key2' value: 'value2'.
	url addPathParameterAt: 3 key: 'key1' value: 'value3'.
	url addPathParameterAt: 4 key: 'jsessionid' value: 42.
	
	self assert: (url pathParameterAt: 1 key: 'jsessionid' ifAbsent: [ 'foo' ]) = 'foo'.
	self assert: (url pathParameterAllAt: 1 key: 'jsessionid' ifAbsent: [ 'foo' ]) = 'foo'.
	
	self assert: (url pathParameterAllAt: 2 key: 'jsessionid' ifAbsent: [ 'bar' ]) = 'bar'.
	self assert: (url pathParameterAt: 2 key: 'jsessionid' ifAbsent: [ 'bar' ]) = 'bar'.
	self assert: (url pathParameterAt: 2 key: 'old' ifAbsent: [ 'bar' ]) isNil.
	self assert: (url pathParameterAllAt: 2 key: 'old' ifAbsent: [ 'bar' ]) = (Array with: nil).
	
	self assert: (url pathParameterAt: 3 key: 'jsessionid' ifAbsent: [ 'bar' ]) = 'bar'.
	self assert: (url pathParameterAllAt: 3 key: 'jsessionid' ifAbsent: [ 'bar' ]) = 'bar'.
	self assert: (url pathParameterAt: 3 key: 'key1' ifAbsent: [ 'bar' ]) = 'value1'.
	self assert: (url pathParameterAllAt: 3 key: 'key1' ifAbsent: [ 'bar' ]) = (Array with: 'value1' with: 'value3').
	self assert: (url pathParameterAt: 3 key: 'key2' ifAbsent: [ 'bar' ]) = 'value2'.
	self assert: (url pathParameterAllAt: 3 key: 'key2' ifAbsent: [ 'bar' ]) = (Array with: 'value2').
	
	self assert: (url pathParameterAllAt: 4 key: 'key1' ifAbsent: [ 'bar' ]) = 'bar'.
	self assert: (url pathParameterAt: 4 key: 'key1' ifAbsent: [ 'bar' ]) = 'bar'.
	self assert: (url pathParameterAt: 4 key: 'jsessionid' ifAbsent: [ 'bar' ]) = 42.
	self assert: (url pathParameterAllAt: 4 key: 'jsessionid' ifAbsent: [ 'bar' ]) = (Array with: 42).
	
	self assert: url greaseString = '/seaside/files;old/WAStandardFiles;key1=value1,value3;key2=value2/seaside.jpg;jsessionid=42?redirectcounter=1'