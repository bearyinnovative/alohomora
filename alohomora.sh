#!/bin/bash

scope=$(printenv QINIU_BUCKET)
accesskey=$(printenv QINIU_ACCESS)
secretkey=$(printenv QINIU_SECRET)
qiniuUrl=$(printenv QINIU_URL)
deadline=$(echo `date +%s` + 3600| bc )

putPolicy="{\"scope\":\"$scope\",\"deadline\":$deadline}"

encodedPutPolicy=`echo -n "$putPolicy" | base64 -w0 | sed 's/\+/-/g; s/\//_/g'`

sign=`echo -n "$encodedPutPolicy" | openssl sha1 -hmac "$secretkey" | awk '{print $2}' | xxd -r -p`
echo $2

encodedSign=`echo -n "$sign" | base64`

uploadToken="$accesskey:$encodedSign:$encodedPutPolicy"

curl -s \
     -F token="$uploadToken" \
     -F file=@$1 \
     'http://upload.qiniu.com/' \
     | python2 -c "import json,sys;obj=json.load(sys.stdin);print '$qiniuUrl' + '/' + obj['key'];"

