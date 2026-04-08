#!/bin/bash

ACCION=$1
INSTANCE=$2
DIR=$3
BUCKET=$4

if [ -z "$ACCION" ]; then
    echo "Faltan parámetros"
    exit 1
fi

echo "Ejecutando EC2..."
python3 ec2/gestionar_ec2.py $ACCION $INSTANCE

if [ $? -ne 0 ]; then
    echo "Error en EC2" >> logs/deploy.log
    exit 1
fi

echo "Ejecutando backup..."
bash s3/backup_s3.sh $DIR $BUCKET

if [ $? -ne 0 ]; then
    echo "Error en S3" >> logs/deploy.log
    exit 1
fi

echo "Deploy completado" >> logs/deploy.log
