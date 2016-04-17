if [ $# -ne 1 ]; then
  echo "usage: ./script.sh <change-set-name>"
  exit 1
fi

ChangeSetId=`aws cloudformation create-change-set --profile sample --stack-name sample --template-body file://$PWD/sample.template --output text --change-set-name $1`
Region="us-west-2"
ChangeSetURL="https://console.aws.amazon.com/cloudformation/home?region=${Region}#/changeset/detail?changeSetId=${ChangeSetId}"
open $ChangeSetURL
