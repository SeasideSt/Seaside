instance-creation
task: taskBlock session: aSession
  task := WAGemStoneServiceTask
    value: [ (Smalltalk at: #'WADynamicVariable') use: aSession during: taskBlock ]