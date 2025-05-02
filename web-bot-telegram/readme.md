# 1. Entrá a la carpeta del proyecto
cd ~/Documents/project/minikube_web/web-bot-telegram

# 2. Creá un entorno virtual llamado `venv`
python3 -m venv venv

# 3. Activá el entorno virtual
source venv/bin/activate

# 4. Instalá los paquetes desde requirements.txt
pip install -r requirements.txt

# 5. Ejecuta el programa
python src/app.py
