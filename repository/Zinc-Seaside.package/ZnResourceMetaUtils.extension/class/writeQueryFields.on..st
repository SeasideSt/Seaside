*Zinc-Seaside
writeQueryFields: dictionary on: stream
	self writeQueryFields: dictionary withEncoder: ZnCharacterEncoder default on: stream 