accessing
localeId
	localeId isNil ifTrue: [
		| session |
		session := self session.
		self session notNil
			ifTrue: [
				"if there's a session take it from the session"
				localeId := session locale asLocaleID ]
			ifFalse: [
				"do language negotiation and take the first supported one"
				self requestContext acceptLanguage do: [ :each |
					| candidate |
					candidate := each value asLocaleID.
					GetTextTranslator translators
						at: candidate
						ifPresent: [ :t |
							translator := t.
							^ localeId := candidate ] ].
				"fall back to default"
				translator := GetTextTranslator default.
				localeId := translator localeID ] ].
	^ localeId