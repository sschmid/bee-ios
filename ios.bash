: "${BEE_PROJECT:="Project"}"
: "${IOS_PROJECT:="${BEE_PROJECT}"}"
: "${IOS_PROJECT_PATH:="Build/iOS/${BEE_PROJECT}/${IOS_PROJECT}.xcodeproj"}"
: "${IOS_WORKSPACE_PATH:="Build/iOS/${BEE_PROJECT}/${IOS_PROJECT}.xcworkspace"}"
: "${IOS_SCHEME:="${IOS_PROJECT}"}"
: "${IOS_ARCHIVE_PATH:="Build/iOS/${BEE_PROJECT}/${BEE_PROJECT}.xcarchive"}"
: "${IOS_EXPORT_PATH:="Build/iOS/${BEE_PROJECT}/Export"}"
: "${IOS_IPA_PATH:="${IOS_EXPORT_PATH}/${IOS_PROJECT}.ipa"}"
: "${IOS_EXPORT_OPTIONS_PATH:="${BEE_RESOURCES}"/ios/ExportOptions.plist}"

ios::help() {
  cat << 'EOF'
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

EOF
}

ios::archive_project() {
  xcodebuild \
    -project "${IOS_PROJECT_PATH}" \
    -scheme "${IOS_SCHEME}" \
    -archivePath "${IOS_ARCHIVE_PATH}" \
    -quiet \
    archive
}

ios::archive_workspace() {
  xcodebuild \
    -workspace "${IOS_WORKSPACE_PATH}" \
    -scheme "${IOS_SCHEME}" \
    -archivePath "${IOS_ARCHIVE_PATH}" \
    -quiet \
    archive
}

ios::export() {
  xcodebuild \
    -exportArchive \
    -archivePath "${IOS_ARCHIVE_PATH}" \
    -exportPath "${IOS_EXPORT_PATH}" \
    -exportOptionsPlist "${IOS_EXPORT_OPTIONS_PATH}" \
    -quiet
}

ios::upload() {
  xcrun altool --upload-app \
    -f "${IOS_IPA_PATH}" \
    -t ios \
    -u "${IOS_USER}" \
    -p "${IOS_PASSWORD}"
}
