private
colorFor: spi
	| colors max |
	colors := self class colors.
	max := 800.
	spi >= max ifTrue: [ ^ colors first ].
	spi = 0 ifTrue: [ ^ colors last ].
	^ colors at: (colors size - (spi / max * colors size) greaseInteger)