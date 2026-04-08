# Proyecto DevOps - Automatización en AWS

## Descripción del proyecto
Este proyecto implementa una solución de automatización en AWS aplicando prácticas DevOps.

Se integran diferentes herramientas para gestionar infraestructura de forma automatizada:

- Gestión de instancias EC2 mediante Python (boto3)
- Respaldo de archivos en S3 mediante Bash
- Control de versiones con Git y GitHub
- Simulación de un flujo CI/CD mediante un script de despliegue

---

## Instrucciones de uso

### 1. Script EC2
Permite listar, iniciar, detener y terminar instancias:

```bash
python3 ec2/gestionar_ec2.py listar
python3 ec2/gestionar_ec2.py iniciar <instance_id>
2. Script S3 (Backup)
bash s3/backup_s3.sh <directorio> <bucket>

Ejemplo:

bash s3/backup_s3.sh data mi-bucket
3. Deploy (CI/CD simulado)
./deploy.sh iniciar

Este script:

Ejecuta acciones sobre EC2
Realiza backup en S3
Genera logs
Flujo Git

Se utilizó la siguiente estrategia:

main → versión estable
develop → integración
feature/* → desarrollo de funcionalidades

Flujo:

feature → develop → main
Ejemplos de uso
./deploy.sh iniciar
python3 ec2/gestionar_ec2.py listar
bash s3/backup_s3.sh data actividad1-ricardo-03024612
Tecnologías utilizadas
AWS EC2
AWS S3
Python (boto3)
Bash
Git / GitHub
