## tODE scripts for creating and controlling a Seaside GemServer in GemStone

For more information about installing Seaside in GemStone see the [GsDevKit_home](https://github.com/GsDevKit/GsDevKit_home) document: [Getting Started with Seaside](https://github.com/GsDevKit/GsDevKit_home/blob/master/docs/gettingStartedWithSeaside.md).

###/home/seaside/gemServer

The `/home/seaside/gemServer` script allows you to **create**, **start**, **stop**, **restart** and **unregister** named gemServers that use the [gsApplicationTools framework](https://github.com/GsDevKit/gsApplicationTools/blob/master/docs/gettingStarted.md#getting-started-with-gem-servers) for controlling Seaside web server gems and the associated Maintenance VMs.

Once you've cloned [Seaside GitUb project](https://github.com/SeasideSt/Seaside)  to your local disk and installed Seaside (see the instructions above), you can `mount` the tode directory in the Seaside clone to make the `gemServer` script available from within tODE:
```Smalltalk
mount @/sys/stone/dirs/Seaside3/tode /home seaside
```

Here's a copy of the current help file from `/home/seaside/gemServer --help`:
```
NAME
  gemServer - gemServer sript utility template

SYNOPSIS
  gemServer [-h|--help]
  gemserver --register=<gemServer-name> --type=[zinc|fastcgi|swazoo] \
            [--port=<server-port>] \
            [--logTo=transcript|objectLog] [--log=all|debug|error|info] \
  gemServer --unregister=<gemServer-name>
  gemServer --interactiveStart=<gemServer-name>
  gemServer --start=<gemServer-name>
  gemServer --stop=<gemServer-name>
  gemServer --restart=<gemServer-name>
  gemServer --errorHandler=remoteHandler|productionHandler|interactiveHandler

DESCRIPTION
  The gemServer script is a wrapper for the gsApplicationTools framework[1].
  For detailed information read "Getting started with Gem Servers"[2].

  You create named gem servers that are associated with a particular Seaside 
  Adaptor (Zinc, FastCGI, or Swazoo) and a particular server port or list of 
  ports in the case of FastCGI:

    ./gemServer --register=seaside --type=zinc --port=1750
    ./gemServer --register=fastcgi --type=fastcgi --ports=`#(9001 9002 9003)`

  Once a name gem server is defined, you can start, stop or restart the gem server
  from the tODE command line:

    ./gemServer --start=seaside
    ./gemServer --stop=seaside
    ./gemServer --restart=seaside

  When you `start` a gem server, a topaz session is started to act as a Seaside web server
  associated with each port that you've defined. A maintenance vm is started as well.


[1] https://github.com/GsDevKit/gsApplicationTools
[2] https://github.com/GsDevKit/gsApplicationTools/blob/master/docs/gettingStarted.md#getting-started-with-gem-servers

EXAMPLES
  ./gemServer --help
  ./gemServer -h
  ./gemServer --register=seaside --type=zinc --port=1750 --log=all \
              --logTo=transcript
  ./gemServer --register=seaside --type=zinc --port=1750 --log=error \
              --logTo=transcript
  ./gemServer --register=seaside --type=zinc --port=1750 --log=error \
               --logTo=objectLog
  ./gemServer --unregister=seaside
  ./gemServer --errorHandler=productionHandler

  ./gemServer --register=fastcgi --type=fastcgi --ports=`#(9001 9002 9003)` \
              --logTo=transcript

  ./gemServer --errorHandler=interactiveHandler
  ./gemServer --interactiveStart=seaside

  ./gemServer --start=seaside
  ./gemServer --stop=seaside
  ./gemServer --restart=seaside

  NOTE - use the `tode it` menu item to run the examples directly from this window.
```


