exporting
exportCatalog

	| translationLiterals |
	translationLiterals := self gatherTranslations.
	[
		stream := exportFile asFileReference ensureDelete; writeStream.
		self exportHeader.
		self exportLiteralsDict: translationLiterals 
	] ensure: [ stream close ]