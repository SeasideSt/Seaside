*seaside-gemstone-gettext-core
seasideGettextExampleFilesDirectory
  | seasideGitCheckoutLocation |
  "Trying to determine the checkout location of the Seaside repo is up for improvement. This is only tested on a GsDevKit setup and Github CI"
  seasideGitCheckoutLocation := (System clientEnvironmentVariable: 'GS_HOME')
    ifNil: [ 
      "Hardcode location on Github CI"
      '/home/runner/work/Seaside/Seaside' ]
    ifNotNil: [ :string | string , '/shared/repos/Seaside/' ].
  Transcript
    show:
      'GETTEXT LOCATION:' , seasideGitCheckoutLocation
        , '/seaside-gettext-example/locale'.
  ^ seasideGitCheckoutLocation , '/seaside-gettext-example/locale'