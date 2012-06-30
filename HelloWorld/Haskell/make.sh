#!/bin/bash

OUT_EXEC="helloWorld"
OUT_DIR="out"

if [ "$#" == 0 ] || [ "$1" == "+run" ]; then  
  if [ ! -d "$OUT_DIR" ]; then
      echo "Creating output directory [$OUT_DIR]..."
      mkdir "$OUT_DIR"
  fi

  echo "Compilling..."
  ghc --make -O2 main.hs -o "$OUT_DIR/$OUT_EXEC" -outputdir "$OUT_DIR"
fi

echo "$1" | grep -q "run"

if [ "$?" == 0 ]; then
  echo "Running..."
  ./"$OUT_DIR/$OUT_EXEC"
fi

if [ "$1" == "clean" ]; then
  echo "Cleaning..."
  rm -rf "$OUT_DIR"
fi