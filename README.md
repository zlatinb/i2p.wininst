# This builds the new windows installer.  

1.  Check out the projects "i2p.i2p" and "i2p.jlink" as siblings of this project.  
2.  Follow the instructions in i2p.jlink to build a mini-JVM for windows.  Do not clean the i2p.i2p branch as some files from there will be used.
3.  Edit version.nsi to match the version of the i2p distributable you're building.
4.  Run build.sh

To build this you will need the following packages, all available in Debian:

* nsis 
* dos2unix
* zip

Note for NSIS v2 - some of the lines in the nsis file are commented out because they only work on NSIS v3.  When building the final release binary, uncomment those lines out.

Note for compression - when building production installer uncomment the "lzma" compressor, it takes a long time but it's worth it!
