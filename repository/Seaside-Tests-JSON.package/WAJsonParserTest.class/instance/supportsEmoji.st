utilities
supportsEmoji
	^ [ String
			with: (Character codePoint: 16r1F1F3) "Regional Indicator Symbol Letter N"
			with: (Character codePoint: 16r1F1F1). "Regional Indicator Symbol Letter L"
		true ]
		on: Error
		do: [ :error | false ]