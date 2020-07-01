#! /bin/bash

ssh -i crauss -o "StrictHostKeyChecking=no" $USUARIO@$SERVER "sudo ./install.sh"
