*seaside-json-core
jsonOn: aRenderer 
	aRenderer array: [
		self do: [ :each |
			aRenderer value: each ] ]