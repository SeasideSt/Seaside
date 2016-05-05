running script
executeGemCommand: command
  | commandLine |
  Transcript
    cr;
    show: '---' , command , ' Seaside gems' , ' (';
    show: TimeStamp now printString;
    show: ')'.
  commandLine := (GsFile _expandEnvVariable: 'GEMSTONE' isClient: false)
    , '/seaside/bin/runSeasideGems30 ' , command , ' ' , self default name , ' '
    , self defaultPortString.
  Transcript
    cr;
    show: (System performOnServer: commandLine) withSqueakLineEndings.
  Transcript
    cr;
    show: '---Finished Seaside gems ' , command , ' (';
    show: TimeStamp now printString;
    show: ')'