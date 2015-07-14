Holds a server that can run unattended in its own gem.  Each Name has to be unique.  Can have a single or multiple ports.  Each port will create a new gem that runs.  Must respond to #startOn: #stop, #port, #ports.

#startOn: should not exit or else the server process will stop.  