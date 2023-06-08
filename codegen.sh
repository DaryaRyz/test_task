#!/bin/bash

type=$1

if [ -z "$type" ]; then
  type=build
fi

gen() {
  flutter clean
  flutter pub get
  flutter pub run build_runner "$type" --delete-conflicting-outputs --verbose
}

genApp() {
  gen
}


genApp
wait