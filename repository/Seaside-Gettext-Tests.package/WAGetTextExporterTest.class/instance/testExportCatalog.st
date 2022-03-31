tests
testExportCatalog
	
	| exporter translationFile |
	translationFile := FileLocator temp / 'seaside_gettext_tests.pot'.
	self deny: translationFile exists.
	exporter := WAGetTextExporter new exportFile: FileLocator temp / 'seaside_gettext_tests.pot'.
	[ exporter exportCatalog.
	self assert: translationFile exists.
	self assert: translationFile contents withInternalLineEndings equals: self fileContentsOfPOTFile. ]
		ensure: [ translationFile ensureDelete ].
	
"Ontkoppel alles van gettextcore
Voeg ook filtering features toe voor packages en misschien categories (via RBBrowserEnvironment>>forPackageNames)."