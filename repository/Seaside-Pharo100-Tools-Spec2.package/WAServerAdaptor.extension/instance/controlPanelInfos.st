*Seaside-Pharo100-Tools-Spec2
controlPanelInfos
	^ String
		streamContents: [ :stream | 
			stream
				nextPutAll: 'Type: ';
				nextPutAll: self class name;
				nextPut: Character cr;
				nextPutAll: 'Port: ';
				nextPutAll: self port greaseString;
				nextPut: Character cr;
				nextPutAll: 'Encoding: ';
				nextPutAll: self codec name;
				nextPut: Character cr.
			self additionalStatusOn: stream.
			stream nextPutAll: self statusString ]