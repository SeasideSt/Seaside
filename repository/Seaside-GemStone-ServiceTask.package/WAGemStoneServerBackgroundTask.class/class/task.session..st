instance creation
task: taskBlock session: aSession
  ^ self new
    task: taskBlock session: aSession;
    yourself