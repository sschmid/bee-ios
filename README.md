# ios
Useful functions for iOS development

https://github.com/sschmid/bee-ios

```
This plugin comes with additional resources.
Please run 'bee res ios' to copy all required files to your project.

template:

  IOS_PROJECT="${BEE_PROJECT}" # default
  IOS_PROJECT_PATH="Build/iOS/${BEE_PROJECT}/${IOS_PROJECT}.xcodeproj" # default
  IOS_WORKSPACE_PATH="Build/iOS/${BEE_PROJECT}/${IOS_PROJECT}.xcworkspace" # default
  IOS_SCHEME="${IOS_PROJECT}" # default
  IOS_ARCHIVE_PATH="Build/iOS/${BEE_PROJECT}/${BEE_PROJECT}.xcarchive" # default
  IOS_EXPORT_PATH="Build/iOS/${BEE_PROJECT}/Export" # default
  IOS_IPA_PATH="${IOS_EXPORT_PATH}/${IOS_PROJECT}.ipa" # default
  IOS_EXPORT_OPTIONS_PATH="${BEE_RESOURCES}"/ios/ExportOptions.plist # default

secrets:

  IOS_USER
  IOS_PASSWORD

usage:

  archive_project     archive Xcode project
  archive_workspace   archive Xcode workspace
  export              export Xcode archive
  upload              upload IPA to TestFlight

requirements:

  Xcode   https://developer.apple.com/xcode
```
