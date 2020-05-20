*Zinc-Seaside
encode: string on: stream
	stream nextPutAll: (ZnResourceMetaUtils encodePercent: string safeSet: #rfc3986SafeSet encoder: ZnCharacterEncoder default)