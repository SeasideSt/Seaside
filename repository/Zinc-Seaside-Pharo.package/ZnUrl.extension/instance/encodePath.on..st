*Zinc-Seaside-Pharo
encodePath: string on: stream
	stream nextPutAll: (ZnResourceMetaUtils encodePercent: string safeSet: #urlPathSafeSet encoder: ZnCharacterEncoder default)