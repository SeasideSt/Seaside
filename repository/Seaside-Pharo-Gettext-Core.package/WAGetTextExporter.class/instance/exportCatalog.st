exporting
exportCatalog 
	"WAGetTextExporter new exportTemplate"
	| translationLiterals | "translationLiterals is a dictionary of keyword ->#(MethodReference...)."
	translationLiterals := self gatherTranslations.
	[stream := exportFile asFileReference ensureDelete; writeStream.
	self exportLiteralsDict: translationLiterals]
		ensure: [stream close]