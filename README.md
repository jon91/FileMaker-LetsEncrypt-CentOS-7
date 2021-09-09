# FileMaker-LetsEncrypt-CentOS-7
A bash script for fetching and renewing Let's Encrypt (certbot) certificates for FileMaker Server running Linux (CentOS7).


### Initial Setup Instructions:
1. Setup CentOS + install FMS (as of now, its 19.2.1-23)
2. Install `certbot`
3. download `wget https://raw.githubusercontent.com/jon91/FileMaker-LetsEncrypt-CentOS-7/main/get-ssl.sh`
4. add execution `chmod ./get-ssl.sh`
5. edit content of script `nano ./get-ssl.sh`
6. run `sudo ./get-ssl.sh`


### Renewal Setup Instructions:
1. download `wget https://raw.githubusercontent.com/jon91/FileMaker-LetsEncrypt-CentOS-7/main/renew-cert.sh`
2. add execution `chmod ./renew-cert.sh`
3. edit content of script `nano ./renew-cert.sh` (only fms usr/pwd edit needed)
4. run `sudo ./renew-cert.sh`


### Troubleshooting
+ I had an issue in stopping/starting the server afterwards, so try
```bash
# Stop FM service
sudo service fmshelper stop

# wait 15 seconds

# Start FM service
sudo service fmshelper start
```


Original Script (Mac): https://github.com/BlueFeatherGroup/FileMaker-LetsEncrypt-Mac

Modified with help from: https://the.fmsoup.org/t/use-of-free-letsencrypt-ssl-certificates-with-fms/1019/7
` --- changed serverKey path`
