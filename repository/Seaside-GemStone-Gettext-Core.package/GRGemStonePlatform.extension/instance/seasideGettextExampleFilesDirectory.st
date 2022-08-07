*seaside-gemstone-gettext-core
seasideGettextExampleFilesDirectory
  | seasideGitCheckoutLocation |
  "Trying to determine the checkout location of the Seaside repo is up for improvement. This is only tested on a GsDevKit setup and Github CI"
  seasideGitCheckoutLocation := (System clientEnvironmentVariable: 'GS_HOME')
    ifNil: [ Error signal: 'GS_HOME not defined (when running seaside gettext example).' ]
    ifNotNil: [ :string | string , '/shared/repos/Seaside' ].
  Transcript
    show:
      'EXISTS: '
        ,
          (ServerFileDirectory
            on: seasideGitCheckoutLocation , '/seaside-gettext-example/locale/')
            exists asString.
  ^ seasideGitCheckoutLocation , '/seaside-gettext-example/locale/'