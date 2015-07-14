instance creation
register: aName for: aTaskClass
  ^ (self
    createServerOfClass: aTaskClass
    withName: aName
    on: self defaultPortOrResourceNameList)
    register;
    yourself