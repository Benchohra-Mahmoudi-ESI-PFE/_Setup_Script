# Setup Script

  Start by downloading the script file (setup_environment.sh)
  
  The script runs heavy downloads, it's better to have a reliable and fast internet connection (approximate download size: 10G). The size is due to a lot of redundant packages, this can very much be optimized.



## First, make the script executable : 
		sudo chmod +x ./setup_environment.sh
		
		
		
## First, run the "setup_environment.sh" script with root privileges (change [project_path] to the desired project path) : 
		sudo ./setup_environment.sh [project_path]



## To run the server app :
##### Change to app dir : 
		cd receiver_app
##### Activate virtual env :
		source flask_app/bin/activate
##### Run the app :
		python3 app.py

##### Or as a one-liner :	
	cd receiver_app && source flask_app/bin/activate && python3 app.py



## To test :
Download and install the .apk file (min : Androind 5.0) from :  
https://drive.google.com/drive/folders/1KuuipegTPrFtlFBROpWfDYh82XAW83X8
