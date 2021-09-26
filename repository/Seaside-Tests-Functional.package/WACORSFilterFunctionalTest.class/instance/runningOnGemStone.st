private
runningOnGemStone
  ^ (Smalltalk at: #'GemServer' ifAbsent: [ nil ]) notNil