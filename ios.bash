#!/usr/bin/env bash

ios::_new() {
  echo '# ios'
  echo 'IOS_PROJECT="Build/iOS/${BEE_PROJECT}/Unity-iPhone.xcodeproj"
IOS_WORKSPACE="Build/iOS/${BEE_PROJECT}/Unity-iPhone.xcworkspace"
IOS_SCHEME="Unity-iPhone"
IOS_ARCHIVE="Build/iOS/${BEE_PROJECT}/${BEE_PROJECT}.xcarchive"
IOS_EXPORT_PATH="Build/iOS/${BEE_PROJECT}/Export"
IOS_IPA="${IOS_EXPORT_PATH}/Unity-iPhone.ipa"
IOS_EXPORT_OPTIONS="${BEE_RESOURCES}"/ios/ExportOptions.plist
# secrets:
# ios.user
# ios.password'
}

ios::archive_project() {
  xcodebuild \
    -project "${IOS_PROJECT}" \
    -scheme "${IOS_SCHEME}" \
    -archivePath "${IOS_ARCHIVE}" \
    -quiet \
    archive
}

ios::archive_workspace() {
  xcodebuild \
    -workspace "${IOS_WORKSPACE}" \
    -scheme "${IOS_SCHEME}" \
    -archivePath "${IOS_ARCHIVE}" \
    -quiet \
    archive
}

ios::export() {
  xcodebuild \
    -exportArchive \
    -archivePath "${IOS_ARCHIVE}" \
    -exportPath "${IOS_EXPORT_PATH}" \
    -exportOptionsPlist "${IOS_EXPORT_OPTIONS}" \
    -quiet
}

ios::upload() {
  local user password
  user="$(bee::secrets ios.user)"
  password="$(bee::secrets ios.password)"
  xcrun altool --upload-app \
    -f "${IOS_IPA}" \
    -t ios \
    -u "${user}" \
    -p "${password}"
}
