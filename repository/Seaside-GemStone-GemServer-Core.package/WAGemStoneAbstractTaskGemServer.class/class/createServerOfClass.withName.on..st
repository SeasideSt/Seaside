instance creation
createServerOfClass: aTaskClass withName: aName on: anArrayOfPortNumbersOrResourceNames
  "taskClass replaces serverClass for task gem servers"

  ^ self new
    taskClass: aTaskClass;
    name: aName;
    portOrResourceNameList: anArrayOfPortNumbersOrResourceNames;
    yourself