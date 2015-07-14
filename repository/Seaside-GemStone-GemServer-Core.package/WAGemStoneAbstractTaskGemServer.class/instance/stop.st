server compat
stop
  self basicServerProcess
    ifNotNil: [ :proc | 
      self basicServerProcess: nil.
      proc terminate ]