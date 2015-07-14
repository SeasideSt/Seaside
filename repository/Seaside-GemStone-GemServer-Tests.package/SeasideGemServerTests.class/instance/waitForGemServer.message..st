private
waitForGemServer: gemServer message: message
  (gemServer waitForStartGems: 20)
    ifFalse: [ 
      Transcript
        cr;
        show: message.
      self assert: false ].
  (Delay forSeconds: 3) wait