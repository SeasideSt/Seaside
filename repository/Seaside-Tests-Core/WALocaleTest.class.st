Class {
	#name : #WALocaleTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-Core-HTTP'
}

{ #category : #tests }
WALocaleTest >> testCountryName [
	| locale |
	locale := WALocale fromString: 'de-CH'.
	
	self assert: locale countryName = 'SWITZERLAND'.
	
	locale := WALocale fromString: 'en-ZA'.
	
	self assert: locale countryName = 'SOUTH AFRICA'.
	
	locale := WALocale fromString: 'eng-ZAF'.
	
	self assert: locale countryName = 'SOUTH AFRICA'

]

{ #category : #tests }
WALocaleTest >> testIso3 [
	| locale |
	locale := WALocale fromString: 'gsw-CHE'.
	self assert: locale language = 'gsw'.
	self assert: locale country = 'CHE'.
	self assert: locale greaseString = 'gsw-CHE'.
	locale := WALocale fromString: 'gsw_CHE'.
	self assert: locale language = 'gsw'.
	self assert: locale country = 'CHE'.
	self assert: locale greaseString = 'gsw-CHE'
]

{ #category : #tests }
WALocaleTest >> testLanguage [
	| locale |
	locale := WALocale language: 'de'.
	self assert: locale language = 'de'.
	self assert: locale country isNil
]

{ #category : #tests }
WALocaleTest >> testLanguageName [
	| locale |
	locale := WALocale fromString: 'de'.
	
	self assert: locale languageName = 'German'.
	
	locale := WALocale fromString: 'gsw'.
	
	self assert: locale languageName = 'Swiss German; Alemannic; Alsatian'
]

{ #category : #tests }
WALocaleTest >> testLangugeAndCountry [
	| locale |
	locale := WALocale fromString: 'de-CH'.
	self assert: locale language = 'de'.
	self assert: locale country = 'CH'.
	self assert: locale greaseString = 'de-CH'.
	locale := WALocale fromString: 'de_CH'.
	self assert: locale language = 'de'.
	self assert: locale country = 'CH'.
	self assert: locale greaseString = 'de-CH'
]

{ #category : #tests }
WALocaleTest >> testLangugeOnly [
	| locale |
	locale := WALocale fromString: 'de'.
	self assert: locale language = 'de'.
	self assert: locale country isNil.
	self assert: locale greaseString = 'de'
]

{ #category : #tests }
WALocaleTest >> testWithoutCountry [
	| locale |
	locale := WALocale fromString: 'de_CH'.
	self assert: locale language = 'de'.
	self assert: locale country = 'CH'.
	locale := locale withoutCountry.
	self assert: locale language = 'de'.
	self assert: locale country isNil.
	
	locale := WALocale fromString: 'de'.
	self assert: locale language = 'de'.
	self assert: locale country isNil.
	locale := locale withoutCountry.
	self assert: locale language = 'de'.
	self assert: locale country isNil
]
