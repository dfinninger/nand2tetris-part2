#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
JAR_FILE=$(find target -name '*-assembly-*.jar')

# Cleanup and reset
rm -rf ./_tmp/
mkdir _tmp

# Copy jar into tmp dir
cp "$JAR_FILE" _tmp/VMTranslator.jar

# Create shim script to launch the jar
cat <<"DOC" > _tmp/VMTranslator
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
java -jar $DIR/VMTranslator.jar $@
DOC
chmod +x _tmp/VMTranslator

# Make a null makefile since we're supplying our own jar
cat <<"DOC" > _tmp/Makefile
all: foo
.PHONY: foo
DOC

cd _tmp || exit
zip submission.zip *
mv submission.zip ..
cd ..

rm -rf ./_tmp/