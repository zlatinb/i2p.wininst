#!/bin/bash
set -e

PKG_DIR=../i2p.i2p/pkg-temp
RES_DIR=../i2p.i2p/installer/resources
JVM_DIR=../i2p.jlink/dist/win
JAR_DIR=../i2p.jlink


rm -rf build *.exe
mkdir build

cp $PKG_DIR/LICENSE.txt build
unix2dos build/LICENSE.txt

mkdir build/pkg

echo "copying files"
cp -R $PKG_DIR/* build/pkg
rm -rf build/pkg/*.app build/pkg/*.command build/pkg/*.template build/pkg/*.bat build/pkg/*.sh
cp $PKG_DIR/eepget.bat build/pkg
rm build/pkg/lib/*.jar
cp $JAR_DIR/*.jar build/pkg/lib
cp $RES_DIR/console.ico build/toopie.ico

echo "removing non-windows jbigi"
zip -d build/pkg/lib/jbigi.jar *osx*
zip -d build/pkg/lib/jbigi.jar *linux*
zip -d build/pkg/lib/jbigi.jar *freebsd*

echo "disabling in-network update"
echo "router.updateDisabled=true" > build/pkg/router.config

echo "re-jarring all jars with zero compression"
cd build/pkg/lib
for j in *.jar; do 
    rm -rf tmp 
    mkdir tmp
    cp $j tmp
    cd tmp
    unzip $j > /dev/null
    rm $j
    $JAVA_HOME/bin/jar -0 -c -f $j *
    cp $j ../
    cd ..
done
rm -rf tmp
cd ../../..

echo "copying jre"
mkdir build/jre
cp -R $JVM_DIR/* build/jre

echo "copying webdefault.xml"
mkdir -p build/pkg/org/eclipse/jetty/webapp
cp $PKG_DIR/eepsite/etc/webdefault.xml build/pkg/org/eclipse/jetty/webapp


cp i2p.bat build/pkg
unix2dos build/pkg/i2p.bat

cp installer.nsi build
cp version.nsi build
cd build && makensis installer.nsi && cp Zero-*.exe ../ && \
	cd .. && echo "built windows installer"
