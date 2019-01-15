#!/bin/bash
function atualizar(){
	echo Atualizando repositórios..
	if ! 	sudo apt-get update
		then
    		echo "Não foi possível atualizar os repositórios. Verifique seu arquivo /etc/apt/sources.list"
    		exit 1
	fi	
	echo "Atualização feita com sucesso"
	echo "Atualizando pacotes já instalados"
	if ! 	sudo apt-get dist-upgrade -y
	then
    	echo "Não foi possível atualizar pacotes."
    	exit 1
	fi
	echo "Atualização de pacotes feita com sucesso"
}
#Instalação do video lan ----------------------------------------
echo Adicionando o repositório videolan...
if ! 	sudo add-apt-repository ppa:videolan/master-daily 
then
	echo "Não foi possível adicionar o repositório videolan."
    	exit 1
fi
atualizar()
echo Instalando o videolan...
if ! sudo apt-get install vlc -y		
then
	echo "Não foi possível adicionar o repositório videolan."
    	exit 1
fi
#------------------------------------------------------------------
#Instalação do chrome ----------------------------------------------
echo Adicionando o repositório chrome...
if ! sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
then
	echo "Não foi possível adicionar o repositório chrome."
    	exit 1
fi
atualizar()
echo Instalando o chrome...
if ! sudo dpkg -i google-chrome-stable_current_amd64.deb
then
	echo "Não foi possível instalar o chrome."
    	exit 1
fi
#Instalação do grub customizer-----------------------------------------
echo Adicionando o repositório grub customizer...
if ! sudo add-apt-repository ppa:danielrichter2007/grub-customizer
then
	echo "Não foi possível adicionar o repositório grub customizer."
    	exit 1
fi

echo Instalando o grub customizer...
if ! sudo apt-get install grub-customizer
then
	echo "Não foi possível instalar o grub customizer."
    	exit 1
fi
echo "Instalação finalizada" a
