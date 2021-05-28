#!/bin/bash
set -x
EXP_NAME=${1:-learning-tsp}-`date "+%Y-%m-%d-%H-%M-%S"`
S3_BUCKET=scm-routeopt-ap-southeast-2

echo "Beginning profilling..."
/home/ec2-user/nsight-systems-2021.2.1/target-linux-x64/nsys profile \
      -t cuda,osrt,nvtx,cudnn,cublas \
      -o profile \
      -w true \
      run_tsp.sh |& tee log.txt

echo "Profiling complete, saving results to S3..."
aws s3 cp profile.qdrep s3://${S3_BUCKET}/profiles/${EXP_NAME}/ |& tee log.txt -a
aws s3 presign s3://${S3_BUCKET}/profiles/${EXP_NAME}/profile.qdrep \
      --expires-in 2678400 |& tee log.txt -a
aws s3 cp runprofile.sh s3://${S3_BUCKET}/profiles/${EXP_NAME}/
aws s3 cp log.txt s3://${S3_BUCKET}/profiles/${EXP_NAME}/
echo "Results written to s3://${S3_BUCKET}/profiles/${EXP_NAME}/"
