# This builds the new windows installer.  

1.  Check out the projects "i2p.i2p" and "i2p.jlink" as siblings of this project.  
2.  Follow the instructions in i2p.jlink to build a mini-JVM for windows.  Do not clean the i2p.i2p branch as some files from there will be used.
3.  Edit version.nsi to match the version of the i2p distributable you're building.
4.  Run build.sh

To build this you will need the following packages, all available in Debian:

* nsis (version 3)
* dos2unix
* zip


