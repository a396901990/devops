#!/usr/bin/bash
set -eu

PRJ_ROOT_DIR=`pwd`

BUILD_STAGE=$1
BUILD_NUMBER=$2
BUILD_NOTE=$*

uploadToHockeyApp () {
    echo upload to hockey app
    # upload to hockapp
    HOCKEY_APP_TOKEN="relace your own token"
    HOCKEY_APP="@${PRJ_ROOT_DIR}/${LOCAL_APK}"

    echo "pwd:${PRJ_ROOT_DIR}, apk: $HOCKEY_APP, BUILD_NOTE:$BUILD_NOTE"
    response=$(curl \
            -F "status=2" \
            -F "notify=1" \
            -F "notes=${BUILD_NOTE}" \
            -F "notes_type=0" \
            -F "ipa=${HOCKEY_APP}" \
            -H "X-HockeyAppToken: ${HOCKEY_APP_TOKEN}" \
            https://rink.hockeyapp.net/api/2/apps/upload
    )
    echo ${response}
}

echo ${BUILD_STAGE}-${BUILD_NUMBER}-${BUILD_NOTE}
if [ "$BUILD_STAGE" == "debug" ];then
LOCAL_APK=`find app/build/outputs -name '*debug.apk'`
else
LOCAL_APK=`find app/build/outputs -name '*release.apk'`
fi

echo ${LOCAL_APK}
uploadToHockeyApp ${LOCAL_APK}
