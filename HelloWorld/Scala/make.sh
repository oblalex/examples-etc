#!/bin/bash

OUT_DIR="classes"

if [ $# == 0 ] || [ $1 == "+run" ]; then  
  if [ ! -d "$OUT_DIR" ]; then
      echo "Creating output directory [$OUT_DIR]..."
      mkdir "$OUT_DIR"
  fi

  echo "Compilling..."
  scalac -d "$OUT_DIR" HelloWorld.scala  
fi

echo $1 | grep -q "run"

if [ $? == 0 ]; then
  echo "Running..."
  scala -classpath "$OUT_DIR" HelloWorld
fi

if [ $1 == "clean" ]; then
  echo "Cleaning..."
  rm -rf "$OUT_DIR"
fi