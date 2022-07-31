*seaside-gemstone-gettext-examples
seasideGettextExampleFilesDirectory
  ^ ((ServerFileDirectory on: (System clientEnvironmentVariable: 'GS_HOME'))
    / 'shared' / 'repos' / 'Seaside' / 'seaside-gettext-example' / 'locale')
    pathString