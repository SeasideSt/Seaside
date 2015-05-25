accessing
codec
	^ codec ifNil: [
		 codec := [ self requestContext codec ] 
			on: WARequestContextNotFound
			do: [ :e | GRNullCodec new ] ]