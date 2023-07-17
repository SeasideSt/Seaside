exporting
gatherTranslations
	| found |
	"Through WATranslatedArgumentsFinder, it finds all 'someString' seasideTranslated 
	translations, and variations on that (e.g. seasideLazyTranslated) 
	returns literals, which is a dictionary of 'someString' -> #(MethodReference...)"
	found := WATranslatedArgumentsFinder new translatedArgumentsIn: rbEnvironment.
	^ self createStringMethodRefDictionary: found.