export CALLBACK_URL="https://flip.mauridev.net"
export DOMAIN_NAME="auth.mauridev.net"
export USERS_BUCKET="apps-user-storage"
export CERTIFICATE="arn:aws:acm:us-east-1:972073858291:certificate/6a8da1db-a6a8-4ace-8855-e2ee47da58ea"
export STACK="authorizer"
export HOSTED_ZONE_ID="Z1IUAUSKRI6O7T"

if [ $1 = "-c" ] || [ $1 = "--create" ]
then

aws cloudformation create-stack \
  	--stack-name $STACK \
	--template-body file://template.yaml \
	--capabilities CAPABILITY_AUTO_EXPAND CAPABILITY_IAM \
	--parameters \
		ParameterKey=DomainName,ParameterValue=$DOMAIN_NAME \
		ParameterKey=Certificate,ParameterValue=$CERTIFICATE \
		ParameterKey=CallbackURL,ParameterValue=$CALLBACK_URL \
		ParameterKey=UsersBucket,ParameterValue=$USERS_BUCKET \
		ParameterKey=HostedZoneId,ParameterValue=$HOSTED_ZONE_ID

fi

if [ $1 = "-u" ] || [ $1 = "--update" ]
then

aws cloudformation update-stack \
  	--stack-name $STACK \
	--template-body file://template.yaml \
	--capabilities CAPABILITY_AUTO_EXPAND CAPABILITY_IAM \
	--parameters \
		ParameterKey=DomainName,ParameterValue=$DOMAIN_NAME \
		ParameterKey=Certificate,ParameterValue=$CERTIFICATE \
		ParameterKey=CallbackURL,ParameterValue=$CALLBACK_URL \
		ParameterKey=UsersBucket,ParameterValue=$USERS_BUCKET \
		ParameterKey=HostedZoneId,ParameterValue=$HOSTED_ZONE_ID

fi

if [ $1 = "-r" ] || [ $1 = "--remove" ]
then
  aws cloudformation delete-stack --stack-name $STACK
fi