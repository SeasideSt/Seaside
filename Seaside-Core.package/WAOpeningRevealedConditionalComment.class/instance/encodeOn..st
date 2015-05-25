printing
encodeOn: aDocument
	aDocument
		nextPutAll: '<!--[';
		nextPutAll: self condition;
		nextPutAll: ']><!-->'