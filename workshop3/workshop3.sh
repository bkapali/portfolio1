#automatic proxy configuration

echo "Detecting network location.."
if ping -c 1 proxy.ecu.edu.au
then
     printf "You are on an ECU network"
     printf "Please enter you ECU username: "
     read username
     printf "Please enter your ECU password: "
     read password

 else
 	printf "another proxy is being used\n"


 fi

