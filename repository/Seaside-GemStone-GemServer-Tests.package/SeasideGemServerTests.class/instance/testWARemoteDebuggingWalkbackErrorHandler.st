tests
testWARemoteDebuggingWalkbackErrorHandler
  [ self runServerErrorTestUsing: WARemoteDebuggingWalkbackErrorHandler ]
    on: Error
    do: [ :ex | 
      Transcript
        cr;
        show:
            'testWARemoteDebuggingWalkbackErrorHandler error: ' , ex description;
        show: (GsProcess stackReportToLevel: 100).
      ex pass ]