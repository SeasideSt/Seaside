*Seaside-Zinc-Pharo
writeQueryFields: dictionary on: stream
	self writeQueryFields: dictionary withEncoder: ZnCharacterEncoder default on: stream 