#automatic proxy configuration

echo "Detecting network location.."
if ping -c 1 proxy.ecu.edu.au
then
     printf "You are on an ECU network"
     printf "Please enter you ECU username: "
     read ecu_username
     printf "Please enter your ECU password: "
     read ecu_password

     #setting proxy
     if [ $(id -u) -ne 0 ]; then
     	echo "need root user to run";
     	exit 1;
     fi

     if [ ! -z $ecu_password  ] && [ ! -z $ecu_username ]; then
     	hostname= "ecu.edu.au"
     	portnumber=443
     	gsettings set org.gnome.system.proxy mode 'manual' 
        gsettings set org.gnome.system.proxy.http host '$hostname'
        gsettings set org.gnome.system.proxy.http port $portnumber

        grep PATH /etc/environment > ecu.t
          printf "http_proxy=http://$hostname:$portnumber\"n\
          HTTP_PROXY=http://$hostname:$portnumber\"\n"
 
          cat ecu.t > /etc/environment

          printf "Acquire::http::proxy \"http://$ecu_username:$ecu_password@$hostname:$portnumber/\";\n"
  
	  echo "Your proxy has been set!"
          echo "You are \"Online\""
          rm -rf ecu.t
     
     else
      	printf "another proxy is being used\n"


 fi


else

	echo "You are off campus"
     if [ $(id -u) -ne 0 ]; then
         echo "need root user to run"
         exit 1
     fi
     
     gsettings set org.gnome.system.proxy mode 'none'

     grep PATH /etc/environment > ecu.t
     cat ecu.t > /etc/environment

     printf "" > /etc/apt/apt.conf.d/95proxies
     rm -rf ecu.t
     
     echo "Proxy settings have been cleared"
     
     if ping -c 1 www.github.com
     then
          echo "You are \"Online\""
     else 
          echo "You are \"Offline\""
     fi
fi

