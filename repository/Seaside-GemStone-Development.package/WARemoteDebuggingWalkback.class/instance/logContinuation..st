actions
logContinuation: title
  "log stack to gem log and call addContinuation"

  | stream stack |
  continuation == nil
    ifTrue: [ ^ self ].
  stack := GsProcess stackReportToLevel: self stackReportLimit.
  stream := WriteStream on: String new.
  stream nextPutAll: '----------- ' , title , ' ' , DateAndTime now printString.
  stream lf.
  stream nextPutAll: exception description.
  stream lf.
  stream nextPutAll: stack.
  stream nextPutAll: '-----------'.
  stream lf.
  GsFile gciLogServer: stream contents.
  self addContinuation