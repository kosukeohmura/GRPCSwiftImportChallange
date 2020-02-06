# GRPCSwiftImportChallange

A sample project for reproducing the problem of https://github.com/grpc/grpc-swift/issues/683.

## How to Repdoduce
1. `make` to create output/GRPCSwiftImportChallange.xcframework
1. Open AppImportsXCFramework/AppImportsXCFramework.xcodeproj and build
1. You will see the 2 errors:
```
Missing required module 'CNIOAtomics'
AppImportsXCFramework/AppImportsXCFramework/ContentView.swift:10:8: Failed to load module 'GRPCSwiftImportChallange'
```
