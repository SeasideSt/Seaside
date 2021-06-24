*Zinc-Seaside-Pharo
encodeQuery: string on: stream
	stream nextPutAll: (ZnResourceMetaUtils encodePercent: string safeSet: #querySafeSet encoder: ZnCharacterEncoder default)