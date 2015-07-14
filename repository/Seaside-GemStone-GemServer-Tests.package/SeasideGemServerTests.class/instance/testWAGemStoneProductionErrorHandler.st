tests
testWAGemStoneProductionErrorHandler
  [ self runServerErrorTestUsing: WAGemStoneProductionErrorHandler ]
    on: Error
    do: [ :ex | 
      Transcript
        cr;
        show: 'testWAGemStoneProductionErrorHandler error: ' , ex description;
        show: (GsProcess stackReportToLevel: 100).
      ex pass ]