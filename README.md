This repo is an init script I use on my Windows machines.
If you run "init.cmd", it will install itself to run every
time the Command Prompt comes up.  It will run `rc.cmd` at
initialization, similar to `~/.profile` in a Unix shell.

The `rc.cmd` here sets up `%PATH%` to add some stuff relative
to this directory, in my use case it's a bunch of binaries
that I will not add to the repo.

Additionally, the following scripts are included

   bin\vcvarsall.cmd

      This looks for vcvarsall.bat (the Visual Studio Command
      Prompt script) in Program Files (x86) and invokes it.
