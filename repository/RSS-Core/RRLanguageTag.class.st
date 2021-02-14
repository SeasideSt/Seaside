Class {
	#name : #RRLanguageTag,
	#superclass : #WATagBrush,
	#category : 'RSS-Core-Tags'
}

{ #category : #accessing }
RRLanguageTag class >> codes [
	^ Array streamContents: [ :stream |
		self codesString lines do: [ :line |
			stream nextPut: (Array
				with: (line copyUpTo: Character tab) asLegalSelector
				with: (line copyAfter: Character tab)) ] ]
]

{ #category : #accessing }
RRLanguageTag class >> codesString [
	^
'Afrikaans	af
Albanian	sq
Basque	eu
Belarusian	be
Bulgarian	bg
Catalan	ca
Chinese (Simplified)	zh-cn
Chinese (Traditional)	zh-tw
Croatian	hr
Czech	cs
Danish	da
Dutch	nl
Dutch (Belgium)	nl-be
Dutch (Netherlands)	nl-nl
English	en
English (Australia)	en-au
English (Belize)	en-bz
English (Canada)	en-ca
English (Ireland)	en-ie
English (Jamaica)	en-jm
English (New Zealand)	en-nz
English (Phillipines)	en-ph
English (South Africa)	en-za
English (Trinidad)	en-tt
English (United Kingdom)	en-gb
English (United States)	en-us
English (Zimbabwe)	en-zw
Estonian	et
Faeroese	fo
Finnish	fi
French	fr
French (Belgium)	fr-be
French (Canada)	fr-ca
French (France)	fr-fr
French (Luxembourg)	fr-lu
French (Monaco)	fr-mc
French (Switzerland)	fr-ch
Galician	gl
Gaelic	gd
German	de
German (Austria)	de-at
German (Germany)	de-de
German (Liechtenstein)	de-li
German (Luxembourg)	de-lu
German (Switzerland)	de-ch
Greek	el
Hawaiian	haw
Hungarian	hu
Icelandic	is
Indonesian	in
Irish	ga
Italian	it
Italian (Italy)	it-it
Italian (Switzerland)	it-ch
Japanese	ja
Korean	ko
Macedonian	mk
Norwegian	no
Polish	pl
Portuguese	pt
Portuguese (Brazil)	pt-br
Portuguese (Portugal)	pt-pt
Romanian	ro
Romanian (Moldova)	ro-mo
Romanian (Romania)	ro-ro
Russian	ru
Russian (Moldova)	ru-mo
Russian (Russia)	ru-ru
Serbian	sr
Slovak	sk
Slovenian	sl
Spanish	es
Spanish (Argentina)	es-ar
Spanish (Bolivia)	es-bo
Spanish (Chile)	es-cl
Spanish (Colombia)	es-co
Spanish (Costa Rica)	es-cr
Spanish (Dominican Republic)	es-do
Spanish (Ecuador)	es-ec
Spanish (El Salvador)	es-sv
Spanish (Guatemala)	es-gt
Spanish (Honduras)	es-hn
Spanish (Mexico)	es-mx
Spanish (Nicaragua)	es-ni
Spanish (Panama)	es-pa
Spanish (Paraguay)	es-py
Spanish (Peru)	es-pe
Spanish (Puerto Rico)	es-pr
Spanish (Spain)	es-es
Spanish (Uruguay)	es-uy
Spanish (Venezuela)	es-ve
Swedish	sv
Swedish (Finland)	sv-fi
Swedish (Sweden)	sv-se
Turkish	tr
Ukranian	uk'
]

{ #category : #generating }
RRLanguageTag class >> generateFor: aPair [
	(self includesSelector: aPair first) ifFalse: [
		self 
			compile: aPair first, '
	self with: ''', aPair last, ''''
			classified: self generatedCategory ]
]

{ #category : #generating }
RRLanguageTag class >> generateTags [
	^ self codes do: [ :each | self generateFor: each ]
]

{ #category : #accessing }
RRLanguageTag class >> generatedCategory [
	^ 'languages-generated'
]

{ #category : #'languages-generated' }
RRLanguageTag >> afrikaans [
	self with: 'af'
]

{ #category : #'languages-generated' }
RRLanguageTag >> albanian [
	self with: 'sq'
]

{ #category : #'languages-generated' }
RRLanguageTag >> basque [
	self with: 'eu'
]

{ #category : #'languages-generated' }
RRLanguageTag >> belarusian [
	self with: 'be'
]

{ #category : #'languages-generated' }
RRLanguageTag >> bulgarian [
	self with: 'bg'
]

{ #category : #'languages-generated' }
RRLanguageTag >> catalan [
	self with: 'ca'
]

{ #category : #'languages-generated' }
RRLanguageTag >> chineseSimplified [
	self with: 'zh-cn'
]

{ #category : #'languages-generated' }
RRLanguageTag >> chineseTraditional [
	self with: 'zh-tw'
]

{ #category : #'languages-generated' }
RRLanguageTag >> croatian [
	self with: 'hr'
]

{ #category : #'languages-generated' }
RRLanguageTag >> czech [
	self with: 'cs'
]

{ #category : #'languages-generated' }
RRLanguageTag >> danish [
	self with: 'da'
]

{ #category : #'languages-generated' }
RRLanguageTag >> dutch [
	self with: 'nl'
]

{ #category : #'languages-generated' }
RRLanguageTag >> dutchBelgium [
	self with: 'nl-be'
]

{ #category : #'languages-generated' }
RRLanguageTag >> dutchNetherlands [
	self with: 'nl-nl'
]

{ #category : #'languages-generated' }
RRLanguageTag >> english [
	self with: 'en'
]

{ #category : #'languages-generated' }
RRLanguageTag >> englishAustralia [
	self with: 'en-au'
]

{ #category : #'languages-generated' }
RRLanguageTag >> englishBelize [
	self with: 'en-bz'
]

{ #category : #'languages-generated' }
RRLanguageTag >> englishCanada [
	self with: 'en-ca'
]

{ #category : #'languages-generated' }
RRLanguageTag >> englishIreland [
	self with: 'en-ie'
]

{ #category : #'languages-generated' }
RRLanguageTag >> englishJamaica [
	self with: 'en-jm'
]

{ #category : #'languages-generated' }
RRLanguageTag >> englishNewZealand [
	self with: 'en-nz'
]

{ #category : #'languages-generated' }
RRLanguageTag >> englishPhillipines [
	self with: 'en-ph'
]

{ #category : #'languages-generated' }
RRLanguageTag >> englishSouthAfrica [
	self with: 'en-za'
]

{ #category : #'languages-generated' }
RRLanguageTag >> englishTrinidad [
	self with: 'en-tt'
]

{ #category : #'languages-generated' }
RRLanguageTag >> englishUnitedKingdom [
	self with: 'en-gb'
]

{ #category : #'languages-generated' }
RRLanguageTag >> englishUnitedStates [
	self with: 'en-us'
]

{ #category : #'languages-generated' }
RRLanguageTag >> englishZimbabwe [
	self with: 'en-zw'
]

{ #category : #'languages-generated' }
RRLanguageTag >> estonian [
	self with: 'et'
]

{ #category : #'languages-generated' }
RRLanguageTag >> faeroese [
	self with: 'fo'
]

{ #category : #'languages-generated' }
RRLanguageTag >> finnish [
	self with: 'fi'
]

{ #category : #'languages-generated' }
RRLanguageTag >> french [
	self with: 'fr'
]

{ #category : #'languages-generated' }
RRLanguageTag >> frenchBelgium [
	self with: 'fr-be'
]

{ #category : #'languages-generated' }
RRLanguageTag >> frenchCanada [
	self with: 'fr-ca'
]

{ #category : #'languages-generated' }
RRLanguageTag >> frenchFrance [
	self with: 'fr-fr'
]

{ #category : #'languages-generated' }
RRLanguageTag >> frenchLuxembourg [
	self with: 'fr-lu'
]

{ #category : #'languages-generated' }
RRLanguageTag >> frenchMonaco [
	self with: 'fr-mc'
]

{ #category : #'languages-generated' }
RRLanguageTag >> frenchSwitzerland [
	self with: 'fr-ch'
]

{ #category : #'languages-generated' }
RRLanguageTag >> gaelic [
	self with: 'gd'
]

{ #category : #'languages-generated' }
RRLanguageTag >> galician [
	self with: 'gl'
]

{ #category : #'languages-generated' }
RRLanguageTag >> german [
	self with: 'de'
]

{ #category : #'languages-generated' }
RRLanguageTag >> germanAustria [
	self with: 'de-at'
]

{ #category : #'languages-generated' }
RRLanguageTag >> germanGermany [
	self with: 'de-de'
]

{ #category : #'languages-generated' }
RRLanguageTag >> germanLiechtenstein [
	self with: 'de-li'
]

{ #category : #'languages-generated' }
RRLanguageTag >> germanLuxembourg [
	self with: 'de-lu'
]

{ #category : #'languages-generated' }
RRLanguageTag >> germanSwitzerland [
	self with: 'de-ch'
]

{ #category : #'languages-generated' }
RRLanguageTag >> greek [
	self with: 'el'
]

{ #category : #'languages-generated' }
RRLanguageTag >> hawaiian [
	self with: 'haw'
]

{ #category : #'languages-generated' }
RRLanguageTag >> hungarian [
	self with: 'hu'
]

{ #category : #'languages-generated' }
RRLanguageTag >> icelandic [
	self with: 'is'
]

{ #category : #'languages-generated' }
RRLanguageTag >> indonesian [
	self with: 'in'
]

{ #category : #'languages-generated' }
RRLanguageTag >> irish [
	self with: 'ga'
]

{ #category : #'languages-generated' }
RRLanguageTag >> italian [
	self with: 'it'
]

{ #category : #'languages-generated' }
RRLanguageTag >> italianItaly [
	self with: 'it-it'
]

{ #category : #'languages-generated' }
RRLanguageTag >> italianSwitzerland [
	self with: 'it-ch'
]

{ #category : #'languages-generated' }
RRLanguageTag >> japanese [
	self with: 'ja'
]

{ #category : #'languages-generated' }
RRLanguageTag >> korean [
	self with: 'ko'
]

{ #category : #'languages-generated' }
RRLanguageTag >> macedonian [
	self with: 'mk'
]

{ #category : #'languages-generated' }
RRLanguageTag >> norwegian [
	self with: 'no'
]

{ #category : #'languages-generated' }
RRLanguageTag >> polish [
	self with: 'pl'
]

{ #category : #'languages-generated' }
RRLanguageTag >> portuguese [
	self with: 'pt'
]

{ #category : #'languages-generated' }
RRLanguageTag >> portugueseBrazil [
	self with: 'pt-br'
]

{ #category : #'languages-generated' }
RRLanguageTag >> portuguesePortugal [
	self with: 'pt-pt'
]

{ #category : #'languages-generated' }
RRLanguageTag >> romanian [
	self with: 'ro'
]

{ #category : #'languages-generated' }
RRLanguageTag >> romanianMoldova [
	self with: 'ro-mo'
]

{ #category : #'languages-generated' }
RRLanguageTag >> romanianRomania [
	self with: 'ro-ro'
]

{ #category : #'languages-generated' }
RRLanguageTag >> russian [
	self with: 'ru'
]

{ #category : #'languages-generated' }
RRLanguageTag >> russianMoldova [
	self with: 'ru-mo'
]

{ #category : #'languages-generated' }
RRLanguageTag >> russianRussia [
	self with: 'ru-ru'
]

{ #category : #'languages-generated' }
RRLanguageTag >> serbian [
	self with: 'sr'
]

{ #category : #'languages-generated' }
RRLanguageTag >> slovak [
	self with: 'sk'
]

{ #category : #'languages-generated' }
RRLanguageTag >> slovenian [
	self with: 'sl'
]

{ #category : #'languages-generated' }
RRLanguageTag >> spanish [
	self with: 'es'
]

{ #category : #'languages-generated' }
RRLanguageTag >> spanishArgentina [
	self with: 'es-ar'
]

{ #category : #'languages-generated' }
RRLanguageTag >> spanishBolivia [
	self with: 'es-bo'
]

{ #category : #'languages-generated' }
RRLanguageTag >> spanishChile [
	self with: 'es-cl'
]

{ #category : #'languages-generated' }
RRLanguageTag >> spanishColombia [
	self with: 'es-co'
]

{ #category : #'languages-generated' }
RRLanguageTag >> spanishCostaRica [
	self with: 'es-cr'
]

{ #category : #'languages-generated' }
RRLanguageTag >> spanishDominicanRepublic [
	self with: 'es-do'
]

{ #category : #'languages-generated' }
RRLanguageTag >> spanishEcuador [
	self with: 'es-ec'
]

{ #category : #'languages-generated' }
RRLanguageTag >> spanishElSalvador [
	self with: 'es-sv'
]

{ #category : #'languages-generated' }
RRLanguageTag >> spanishGuatemala [
	self with: 'es-gt'
]

{ #category : #'languages-generated' }
RRLanguageTag >> spanishHonduras [
	self with: 'es-hn'
]

{ #category : #'languages-generated' }
RRLanguageTag >> spanishMexico [
	self with: 'es-mx'
]

{ #category : #'languages-generated' }
RRLanguageTag >> spanishNicaragua [
	self with: 'es-ni'
]

{ #category : #'languages-generated' }
RRLanguageTag >> spanishPanama [
	self with: 'es-pa'
]

{ #category : #'languages-generated' }
RRLanguageTag >> spanishParaguay [
	self with: 'es-py'
]

{ #category : #'languages-generated' }
RRLanguageTag >> spanishPeru [
	self with: 'es-pe'
]

{ #category : #'languages-generated' }
RRLanguageTag >> spanishPuertoRico [
	self with: 'es-pr'
]

{ #category : #'languages-generated' }
RRLanguageTag >> spanishSpain [
	self with: 'es-es'
]

{ #category : #'languages-generated' }
RRLanguageTag >> spanishUruguay [
	self with: 'es-uy'
]

{ #category : #'languages-generated' }
RRLanguageTag >> spanishVenezuela [
	self with: 'es-ve'
]

{ #category : #'languages-generated' }
RRLanguageTag >> swedish [
	self with: 'sv'
]

{ #category : #'languages-generated' }
RRLanguageTag >> swedishFinland [
	self with: 'sv-fi'
]

{ #category : #'languages-generated' }
RRLanguageTag >> swedishSweden [
	self with: 'sv-se'
]

{ #category : #accessing }
RRLanguageTag >> tag [
	^ 'language'
]

{ #category : #'languages-generated' }
RRLanguageTag >> turkish [
	self with: 'tr'
]

{ #category : #'languages-generated' }
RRLanguageTag >> ukranian [
	self with: 'uk'
]
