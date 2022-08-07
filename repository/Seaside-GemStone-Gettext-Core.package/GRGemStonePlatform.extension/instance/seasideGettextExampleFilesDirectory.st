*seaside-gemstone-gettext-core
seasideGettextExampleFilesDirectory
  | seasideGitCheckoutLocation |
  "Trying to determine the checkout location of the Seaside repo is up for improvement. This is only tested on a GsDevKit setup and Github CI"
  seasideGitCheckoutLocation := (System clientEnvironmentVariable: 'GS_HOME')
    ifNil: [ Error raise: 'GS_HOME not defined (when running seaside gettext example).' ]
    ifNotNil: [ :string | string , '/shared/repos/Seaside/' ].
  ^ seasideGitCheckoutLocation , '/seaside-gettext-example/locale'