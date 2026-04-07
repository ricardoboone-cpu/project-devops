# listar instancias
import boto3
import sys

ec2 = boto3.client('ec2')

def listar():
    res = ec2.describe_instances()
    for r in res['Reservations']:
        for i in r['Instances']:
            print(i['InstanceId'], i['State']['Name'])

def iniciar(instance_id):
    ec2.start_instances(InstanceIds=[instance_id])
    print("Iniciando", instance_id)

def detener(instance_id):
    ec2.stop_instances(InstanceIds=[instance_id])
    print("Deteniendo", instance_id)

def terminar(instance_id):
    ec2.terminate_instances(InstanceIds=[instance_id])
    print("Terminando", instance_id)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Uso: python3 gestionar_ec2.py [listar|iniciar|detener|terminar] [instance_id]")
        exit()

    accion = sys.argv[1]
# listar instancias

    if accion == "listar":
        listar()
    elif accion in ["iniciar", "detener", "terminar"]:
        if len(sys.argv) < 3:
            print("Falta instance_id")
            exit()

        instance_id = sys.argv[2]

        if accion == "iniciar":
            iniciar(instance_id)
        elif accion == "detener":
            detener(instance_id)
        elif accion == "terminar":
            terminar(instance_id)
    else:
        print("Acción inválida")

