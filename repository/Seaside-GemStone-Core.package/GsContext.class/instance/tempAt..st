accessing
tempAt: index
  | ar |
  ar := continuation _frameContentsAt: level.
  ar size < (10 + index)
    ifTrue: [ ^ nil ].
  ^ ar at: 10 + index