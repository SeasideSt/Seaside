```language=Pharo
| baseDir |
"Create me from the files in the Seaside git repository"
baseDir := FileLocator workingDirectory / 'pharo-local/iceberg/SeasideSt/Seaside/seaside-gettext-example/locale'.
#(#de_CH #fr #nl_BE) do:[ :localeId |
	WAGettextTestingFileLibrary 
		addFileNamed: localeId,'.mo'
		contents: (GRPlatform current contentsOfFile: (baseDir / localeId / 'LC_MESSAGES' / 'seaside-gettext-example.mo') fullName binary: true) ].
```