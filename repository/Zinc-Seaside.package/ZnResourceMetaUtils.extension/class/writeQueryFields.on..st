*Zinc-Seaside
writeQueryFields: dictionary on: stream
	self writeQueryFields: dictionary withEncoder: ZnDefaultCharacterEncoder value on: stream 