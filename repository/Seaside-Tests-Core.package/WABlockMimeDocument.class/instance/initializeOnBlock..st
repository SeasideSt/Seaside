initialization
initializeOnBlock: aNiladicBlock
	self initialize.
	self mimeType: nil.
	self fileName: nil.
	block := aNiladicBlock