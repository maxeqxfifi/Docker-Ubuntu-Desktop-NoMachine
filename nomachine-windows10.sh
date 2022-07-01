wget -O ng.sh https://raw.githubusercontent.com/maxeqxfifi/Docker-Ubuntu-Desktop-NoMachine/main/ngrok.sh > /dev/null 2>&1
chmod +x ng.sh
./ng.sh


function goto
{
    label=$1
    cd 
    cmd=$(sed -n "/^:[[:blank:]][[:blank:]]*${label}/{:a;n;p;ba};" $0 | 
          grep -v ':$')
    eval "$cmd"
    exit
}

: ngrok
clear
echo "Idź do: https://dashboard.ngrok.com/get-started/your-authtoken"
read -p "Wklej Ngrok Authtoken: " CRP
./ngrok authtoken $CRP

clear
echo "======================="
echo "Wybierz region ngroka (dla lepszego polaczenia)."
echo "======================="
echo "us - Stany Zjednoczone (Ohio)"
echo "eu - Europa (Frankfurt)"
echo "ap - Azja/Pacyfik (Singapore)"
echo "au - Australia (Sydney)"
echo "sa - Ameryka Południowa (Sao Paulo)"
echo "jp - Japonia (Tokyo)"
echo "in - Indie (Mumbai)"
read -p "Wybierz region ngroka: " CRP
./ngrok tcp 4000 &>/dev/null &
sleep 1
if curl --silent --show-error http://127.0.0.1:4040/api/tunnels  > /dev/null 2>&1; then echo OK; else echo "Ngrok Error! Please try again!" && sleep 1 && goto ngrok; fi
docker run --rm -d --network host --privileged --name nomachine-xfce4 -e PASSWORD=123456 -e USER=user --cap-add=SYS_PTRACE --shm-size=1g thuonghai2711/nomachine-ubuntu-desktop:windows10
clear
echo IP Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p' 
echo User: user
echo Passwd: 123456
echo "VM can't connect? Restart Cloud Shell then Re-run script."
seq 1 9999999998 | while read i; do echo -en "\r Running .     $i s /9999999998 s";sleep 0.1;echo -en "\r Running ..    $i s /9999999998 s";sleep 0.1;echo -en "\r Running ...   $i s /9999999998 s";sleep 0.1;echo -en "\r Running ....  $i s /9999999998 s";sleep 0.1;echo -en "\r Running ..... $i s /9999999998 s";sleep 0.1;echo -en "\r Running     . $i s /9999999998 s";sleep 0.1;echo -en "\r Running  .... $i s /9999999998 s";sleep 0.1;echo -en "\r Running   ... $i s /9999999998 s";sleep 0.1;echo -en "\r Running    .. $i s /9999999998 s";sleep 0.1;echo -en "\r Running     . $i s /9999999998 s";sleep 0.1; done
