PROJECT_DIR=$(dir $(lastword $(MAKEFILE_LIST)))
OUTPUT_DIR=${PROJECT_DIR}output
IPHONEOS_ARCHIVE_PATH=${OUTPUT_DIR}/iphoneos.xcarchive
SIMULATOR_ARCHIVE_PATH=${OUTPUT_DIR}/iphonesimulator.xcarchive

all:
	rm -rf ${OUTPUT_DIR}
	mkdir ${OUTPUT_DIR}
	xcodebuild archive -project GRPCSwiftImportChallange.xcodeproj -scheme GRPCSwiftImportChallange -configuration Release -derivedDataPath ${OUTPUT_DIR} -archivePath ${IPHONEOS_ARCHIVE_PATH} -sdk iphoneos SKIP_INSTALL=NO
	xcodebuild archive -project GRPCSwiftImportChallange.xcodeproj -scheme GRPCSwiftImportChallange -configuration Release -derivedDataPath ${OUTPUT_DIR} -archivePath ${SIMULATOR_ARCHIVE_PATH} -sdk iphonesimulator SKIP_INSTALL=NO
	xcodebuild -create-xcframework \
		-framework ${IPHONEOS_ARCHIVE_PATH}/Products/Library/Frameworks/GRPCSwiftImportChallange.framework \
		-framework ${SIMULATOR_ARCHIVE_PATH}/Products/Library/Frameworks/GRPCSwiftImportChallange.framework \
		-output ${OUTPUT_DIR}/GRPCSwiftImportChallange.xcframework
