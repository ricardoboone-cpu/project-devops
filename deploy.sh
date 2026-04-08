#!/bin/bash
source config/config.env
export AWS_DEFAULT_REGION=$REGION
# integración EC2
ACCION=$1
INSTANCE=$2
DIR=$3
BUCKET=$4

if [ -z "$ACCION" ]; then
    echo "Faltan parámetros"
    exit 1
fi

echo "Ejecutando EC2..."
python3 ec2/gestionar_ec2.py $ACCION $INSTANCE_ID

if [ $? -ne 0 ]; then
    echo "Error en EC2" >> logs/deploy.log
    exit 1
fi
# integración S3
echo "Ejecutando backup..."
bash s3/backup_s3.sh $DIRECTORY $BUCKET_NAME

if [ $? -ne 0 ]; then
    echo "Error en S3" >> logs/deploy.log
    exit 1
fi

echo "Deploy completado" >> logs/deploy.log
