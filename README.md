# Setup Script

  Start by downloading the script file (setup_environment.sh)
  
  The script runs heavy downloads, it's better to have a reliable and fast internet.
  Approximate download size : 10G
  The size is due to a lot of redundant packages, this can very much be optimized.

  ## 1) First, run the "setup_environment.sh" script with root privileges : 
  		<code> sudo ./setup_environment.sh </code>


  ## 2) To run the server app :
      * Change to app dir : 
		<code> cd receiver_app </code>
      * Activate virtual env :
	  	<code>source flask_app/bin/activate </code>
      * Run the app :
		<code> python3 app.py </code>

      * Or as a one-liner :	
		<code> cd receiver_app && source flask_app/bin/activate && python3 app.py </code>


  3) To test :
	# Download and install the .apk file (min : Androind 5.0) from :  
	https://drive.google.com/drive/folders/1KuuipegTPrFtlFBROpWfDYh82XAW83X8
