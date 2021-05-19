curl https://codebuild-sachin-test-output-bucket.s3.us-east-2.amazonaws.com/Test8/myStoreId/my-key.jks -o my-key.jks
FILE=my-key.jks
STRING='AccessDenied'
if [[ ! -z $(grep "$STRING" "$FILE") ]];
then
  echo "key store not found, generating"
  keytool -genkeypair -dname "cn=Sachin, ou=EnggTeam, o=Bikayi, c=IN" -alias my-alias -keypass 123456 -keystore my-key.jks -keyalg DSA -storepass 123456 -validity 10000
else
  echo "key store found downloading"
fi
