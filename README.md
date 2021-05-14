# FileMaker-LetsEncrypt-CentOS-7
A bash script for fetching and renewing Let's Encrypt (certbot) certificates for FileMaker Server running Linux (CentOS7).


### Instructions:
1. Setup CentOS + install FMS (as of now, its 19.2.1-23)
2. Install `certbot`
3. download `wget https://raw.githubusercontent.com/jon91/FileMaker-LetsEncrypt-CentOS-7/main/get-ssl.sh`
4. add execution `chmod ./get-ssl.sh`
5. edit content of script `nano ./get-ssl.sh`
6. run `sudo ./get-ssl.sh`


### Troubleshooting
+ I had an issue in stopping/starting the server afterwards, so try
```bash
# Stop FM service
sudo service fmshelper stop

# wait 15 seconds

# Start FM service
sudo service fmshelper start
```


#### ORIGINAL MAC VERSION FROM https://github.com/BlueFeatherGroup/FileMaker-LetsEncrypt-Mac

#### MODIFIED VERSION FROM https://the.fmsoup.org/t/use-of-free-letsencrypt-ssl-certificates-with-fms/1019/7
` --- changed serverKey path`
