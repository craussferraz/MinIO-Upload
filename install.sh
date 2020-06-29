#! /bin/bash
#
source export.sh

# baixando dependendicas
apt update
apt install 
apt install -y python3 python3-pip wget unzip git 

# Baixando o minio.
wget https://dl.minio.io/server/minio/release/linux-amd64/minio -O /usr/local/bin/minio
wget https://dl.min.io/client/mc/release/linux-amd64/mc -O /usr/local/bin/mc
chmod +x /usr/local/bin/minio
chmod +x /usr/local/bin/mc
# inicializando o minio
minio --quiet server /srv/data &
sleep 13
# configurando o minio
mc config host add myminio http://$SERVERIP:9000 $MINIO_ACCESS_KEY $MINIO_SECRET_KEY
# criando bucket docs
mc mb myminio/docs
# baixando e instalando o minio_uploader
cd /srv
if [ -e minio_uploader.zip ]; then
	rm -rf minio_uploade*
fi
wget https://github.com/craussferraz/minio_CI/raw/master/minio_uploader.zip
unzip minio_uploader.zip
cd minio_uploader
pip3 install pipenv
pipenv --python 3 install --system --deploy
gunicorn --bind 0.0.0.0:5000 wsgi:app &
