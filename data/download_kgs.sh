#!/bin/sh

BASEDIR=`pwd`

if [ ! -d "$BASEDIR" ]; then
    mkdir "$BASEDIR"
fi

# ChemProt
if [ ! -d "$BASEDIR/ChemProt" ]; then
    echo Downloading ChemProt
    cd $BASEDIR
    curl -O https://drive.usercontent.google.com/download?id=1SPVpFMuFHhty4iOiF41PB9x1AgLTNMMd&export=download&authuser=0&confirm=t&uuid=ea98a770-91c4-4157-a0d0-8a63713e5b1e&at=AC2mKKQjSSlYC8zfwFL-9ceKf9ZF:1690009129782
    tar xvf ChemProt.tar.gz
else
    echo ChemProt already present
fi
if [ ! -f "$BASEDIR/ChemProt/dataset.yaml" ]; then
    python preprocess.py ChemProt
else
    echo ChemProt already prepared
fi

# DrugProt
if [ ! -d "$BASEDIR/DrugProt" ]; then
    echo Downloading DrugProt
    cd $BASEDIR
    curl -O https://drive.usercontent.google.com/download?id=1jyh85nXHvk0K7e3yLDwVKjtjWhFO--B8&export=download&authuser=0&confirm=t&uuid=5ce6d15d-a829-4e9c-aaf6-bc9dc3fc1c6b&at=AC2mKKQi1DSRZ2CgJ7hVqqqVWnaX:1690009156464
    tar xvf DrugProt.tar.gz
else
    echo DrugProt already present
fi
if [ ! -f "$BASEDIR/DrugProt/dataset.yaml" ]; then
    python preprocess.py DrugProt
else
    echo DrugProt already prepared
fi


