```
		─────────────────────────────────────────────────────────────────────────
		─██████████████─██████──────────██████─██████████████─████████──████████─
		─██░░░░░░░░░░██─██░░██──────────██░░██─██░░░░░░░░░░██─██░░░░██──██░░░░██─
		─██░░██████████─██░░██──────────██░░██─██░░██████░░██─████░░██──██░░████─
		─██░░██─────────██░░██──────────██░░██─██░░██──██░░██───██░░░░██░░░░██───
		─██░░██████████─██░░██──██████──██░░██─██░░██████░░██───████░░░░░░████───
		─██░░░░░░░░░░██─██░░██──██░░██──██░░██─██░░░░░░░░░░██─────████░░████─────
		─██████████░░██─██░░██──██░░██──██░░██─██░░██████░░██───────██░░██───────
		─────────██░░██─██░░██████░░██████░░██─██░░██──██░░██───────██░░██───────
		─██████████░░██─██░░░░░░░░░░░░░░░░░░██─██░░██──██░░██───────██░░██───────
		─██░░░░░░░░░░██─██░░██████░░██████░░██─██░░██──██░░██───────██░░██───────
		─██████████████─██████──██████──██████─██████──██████───────██████───────
		─────────────────────────────────────────────────────────────────────────	
```

## PART 1:<b>Welcome</b>
* ### <b>Why:</b> Was SW:AY developed?
    * SW:AY was developed to show off the playPORTAL Swift SDK in a simplistic way.
    * It's underlying purpose was to be a "demo app" for the [2018 Clemson Hackathon](http://www.clemson.edu/centers-institutes/spiro/service/hackathon.html)

* ### <b>Info:</b> Important to read this all...
    * <i>PART 2:</i> Walks you through playPORTAL integration, it should be fairly straightforward.
    * Make sure to read it all, to ensure sucsess! If you get stuck at anytime there are also [this](https://studio.playportal.io/api/sdk/ios) detailed documentation to look at.

* ### <b>Other:</b> The Rise Collection.
    * Make sure to checkout our [portfolio](https://itunes.apple.com/us/developer/joshua-paulsen/id1000072797) and [website](http://www.therisecollection.co)


## PART 2: <b>playPortal Setup</b>

### App Overview
<br/>
* SWAY was created using Apple's [GameKit](https://developer.apple.com/documentation/gamekit). We wanted to show off, how easy and fun the playPORTAL sdk was to work with!*

[More Info: Apple Watch Core Motion (Accelerometer)](https://developer.apple.com/documentation/coremotion/cmmotionmanager)

### SDK Features Used
<img src="https://gyazo.com/350b36dce5bf4edf7e6b3a16c75026b3.png = 1500x1500" width="55%">



## Getting Started (playPORTAL setup)

* ### <b>Step 1:</b> Create playPORTAL Studio Account

	* Navigate to [playPORTAL Studio](https://studio.playportal.io)
	* Click on <b>Sign Up For FREE Account</b>
	* After creating your account, email accounts@playportal.io to introduce yourself and your project and we will consider you for early access.
 

* ### <b>Step 2:</b> Register your App with playPORTAL

	* After confirmation, log in to the [playPORTAL Studio](https://studio.playportal.io)
	* In the left navigation bar click on the <b>Apps</b> tab.
	* In the <b>Apps</b> panel, click on the "+ Add App" button.
	* Add an icon, <b>name</b> & description for your app.
	* For "Environment" leave "Sandbox" selected.
	* Click "Add App"
* ### <b>Step 3:</b> Setup your permission scopes.
	* This is how SWAY was setup, look at the picture for refrence!
	* This step is important!
<img src="https://gyazo.com/350b36dce5bf4edf7e6b3a16c75026b3.png = 1500x1500" width="55%">

* ### <b>Step 4:</b> Generate your Client ID and Client Secret

	* Tap "Client IDs & Secrets"
	* Tap "Generate Client ID"
	* The values generated will be used later.
	* CAUTION: Keep your Client ID & Secret private! Do not commit your credentials!
 
* ### <b>Step 5:</b> Setup GitHub Repo
    * Fork this repo
    * After forking, download or clone it to your local machine
 
* ### <b>Step 6:</b> Fetch repo to all machines
```
 git clone https://github.com/TheRiseCollection/sway.git
 cd sway
```
* ### <b>Step 7:</b> Launch Terminal and install Cocopods version 1.6 [Here](https://cocoapods.org/)
	* ### <b> Step 6.1: </b>After Cocopods is installed 
	 * Open up a terminal, and move into your project folder and do a pod install.
```
pod install
```
* ### <b>Step 8:</b> Launch Xcode 
    * Open up the .xcworkspace file
    * Select a simulator that runs an iPhone and Apple Watch together 
    * Press the play button and run AirTime

* ### <b>Step 9:</b> Hide your keys.
	* The Client ID, & Secrets tied to your application <b>NEED</b> to be hidden
	* This can be done by creating a .gitignore file 
```
cd sway
touch .gitignore
```

* ### <b>Step 9.1:</b>Open up the project in a different IDE
	* To edit your .gitignore open the project in either [Atom](https://atom.io/) or [VSCode](https://code.visualstudio.com/)
	* After the project is open, add the file you stored keys in to the .gitignore
	
* ### <b>Step 10:</b> Develop! 
	* If you made it this far, great you are ready!!!
	* Good luck and have fun developing. 
    
    
* ### <b>Got Stuck?</b> If you did on any of the steps listed here are some links to help!
    * Here is another cocoapods installation directions [link](https://iosdevcenters.blogspot.com/2015/12/how-to-install-cocoapods-in-xcode.html)
    * Read [this](https://github.com/joshnh/Git-Commands) to get a refresher on Git commands 


## Getting Started (playPORTAL setup)

* ### <b>Step 1:</b> Create playPORTAL Studio Account

	* Navigate to [playPORTAL Studio](https://studio.playportal.io)
	* Click on <b>Sign Up For FREE Account</b>
	* After creating your account, email us at accounts@playportal.io to introduce yourself and your project and we will consider you for early access.
 

* ### <b>Step 2:</b> Register your App with playPORTAL
   	* After confirmation, log in to the [playPORTAL Studio](https://studio.playportal.io)
  	* In the left navigation bar click on the <b>Apps</b> tab.
   	* In the <b>Apps</b> panel, click on the "+ Add App" button.
  	* Add an icon (example image [here](https://github.com/playportal-studio/AirTime/blob/master/AirTime/Assets.xcassets/AppIcon.appiconset/ItunesArtwork%402x.png)).
	* Enter a unique app <b>name</b> (you cannot use the name AirTime because it is already in use).
	* Enter a description for your app.
  	* For "Environment" leave "Sandbox" selected.
 	* Click "Add App"
	
<img src="https://gyazo.com/123d7d09cea8bb8cfc3d763709ddc8ba.png = 1500x1500" width="65%">

* ### <b>Step 3:</b> Setup your permission scopes.
	* Add permission scopes for each of the SDK features used in the app. Reference the image below.
<img src="https://gyazo.com/350b36dce5bf4edf7e6b3a16c75026b3.png = 1500x1500" width="55%">

* ### <b>Step 4:</b> Generate your Client ID and Client Secret

	* Tap "Client IDs & Secrets"
	* Tap "Generate Client ID"
	* The values generated will be used later.
	* CAUTION: Keep your Client ID & Secret private! Do not commit your credentials!
 
* ### <b>Step 5:</b> Clone the repository 
	* Open teminal and clone repository to Desktop
    ```
    cd Desktop
    git clone https://github.com/playportal-studio/AirTime.git
    ```
* ### <b>Step 6:</b> Install [Cocopods](https://cocoapods.org/) 
    * To install 
    ```
    sudo gem install cocoapods
    ```
    * After cocoapods is installed, follow these steps
    ```
    cd AirTime
    pod install
    ```
* ### <b>Step 7:</b> Launch Xcode 
    * Open up the .xcworkspace file
    * Select a simulator or device that runs an iPhone and Apple Watch together 
    * Press the play button and run AirTime

* ### <b>Step 8:</b> Hide your keys.
	* The Client ID, & Secrets tied to your application <b>NEED</b> to be hidden
	* This can be done by creating a .gitignore file 
```
cd AirTime
touch .gitignore
```
* ### <b>Step 8.1:</b>Handling keys
	* The keys you generated earlier need to go somewhere in order for the SSO to work.. follow the steps below.
		* Step 1: Create a Keys.swift file inside your project directory.
		* Step 2: Grab your <b>Client ID</b> and your <b>Client Secret</b> from playPORTAL studio.
		* Step 3: Define your keys like this.
		```
		 let cid = "CLIENT ID GOES HERE"
    		 let cse = "CLIENT SECRET GOES HERE"
		 let redirectURI = "REDIRECT URL GOES HERE"
                 let env = "SANDBOX"
		```
		* Step 4: Now that your keys are in a file return to playPORTAL studio.
		* Step 5: Create a Redirect URL following the format below
		```
		appname://redirect
		```
* ### <b>Step 8.2:</b>Open up the project in a different IDE
	* To edit your .gitignore open the project in either [Atom](https://atom.io/) or [VSCode](https://code.visualstudio.com/)
	* After the project is open, add the file you stored keys in to the .gitignore

* ### <b>Step 8.3:</b>Open XCode
	* Now that you have all of your keys in the right place, there is one last step related to tying up the SSO.
		* Step 1: Navigate to your app level settings and click on the info tab.
		* Step 2: Add a new URL under the URL types section.
		* Step 3: Input your app name into the <b>Identifier</b> and <b>URL Schemes</b> see the picture below for refrence.
	
	<img src="https://gyazo.com/bd73716f685418251fd814a1662b5cb8.png = 1500x1500" width="55%">
* ### <b>Step 8.4:</b> Sandbox user information.
	* You are going to need some sandbox users to test with! 
		* Step 1: Go back to [playPORTAL studio](https://studio.playportal.io)
		* Step 2: Click on Sandbox
		* Step 3: Generate your users, use the picture below for reference.
		
	<img src="https://gyazo.com/76ec65dadd301ae7512304e80979323f.png = 1500x1500" width="55%">
	
* ### <b>Step 9:</b> Develop! 
	* If you made it this far, great you are ready!!!
	* Good luck and have fun developing. 
    
    
* ### <b>Got Stuck?</b> If you did on any of the steps listed here are some links to help!
    * Here is another cocoapods installation directions [link](https://iosdevcenters.blogspot.com/2015/12/how-to-install-cocoapods-in-xcode.html)
    * Read [this](https://github.com/joshnh/Git-Commands) to get a refresher on Git commands 





