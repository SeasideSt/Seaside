exporting
exportCatalog

	| translationLiterals |
	translationLiterals := self gatherTranslations.
	[
	stream := exportFile asFileReference ensureDelete; writeStream.
	self exportLiteralsDict: translationLiterals ] ensure: [ stream close ]