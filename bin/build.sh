
set -e
start=`date +%s`

aws_region=$1
access_key_id=$2
secret_key=$3

source_bucket=$4
source_key=$5

file_path=$6

AWS_ACCESS_KEY_ID=$access_key_id AWS_SECRET_ACCESS_KEY=$secret_key aws s3api put-object --bucket $source_bucket --key $source_key --region $aws_region --body $file_path

end=`date +%s`

echo Deploy version ended with success! Time elapsed: $((end-start)) seconds
