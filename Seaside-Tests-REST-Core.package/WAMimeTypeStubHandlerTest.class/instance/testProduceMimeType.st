tests
testProduceMimeType
	self assertContentType: nil accept: 'image/jpeg' produces: 'image/jpeg'.
	self assertContentType: nil accept: 'image/png' produces: 'image/png'