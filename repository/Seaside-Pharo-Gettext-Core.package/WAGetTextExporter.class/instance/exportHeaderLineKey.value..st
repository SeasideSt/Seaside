exporting
exportHeaderLineKey: keyString value: valueString

	stream nextPut: $";
		 nextPutAll: keyString;
		 nextPut: $:;
		 space;
		 nextPutAll: valueString;
		 nextPutAll: '\n';
		 nextPut: $";
		 lf.