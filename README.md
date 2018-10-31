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
    * <b>PART 2:</b> Walks you through playPORTAL integration, it should be fairly straightforward.
    * Make sure to read it all, to ensure sucsess! If you get stuck at anytime there are also [this](https://studio.playportal.io/api/sdk/ios) detailed documentation to look at.

* ### <b>Other:</b> The Rise Collection.
    * Make sure to checkout our [portfolio](https://itunes.apple.com/us/developer/joshua-paulsen/id1000072797) and [website](http://www.therisecollection.co)


## PART 2: <b>playPortal Setup</b>

### App Overview
* SWAY was created using Apple's [GameKit](https://developer.apple.com/documentation/gamekit). We wanted to show off, how easy and fun the playPORTAL sdk was to work with!

### SDK Features Used
<img src="https://gyazo.com/350b36dce5bf4edf7e6b3a16c75026b3.png = 1500x1500" width="55%">



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
	
<img src="https://gyazo.com/2e8580acdd0b8a7b0d42e0b21fb95f9a.png = 1500x1500" width="65%">

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
    git clone https://github.com/TheRiseCollection/sway.git
    ```
* ### <b>Step 6:</b> Install [Cocopods](https://cocoapods.org/) 
    * To install 
    ```
    sudo gem install cocoapods -v 1.6.0.beta.1
    ```
    * After cocoapods is installed, follow these steps
    ```
    cd sway
    pod install
    ```
* ### <b>Step 7:</b> Ensure AirTime Compiles
    * Open up the sway.xcworkspace file
    * Select a simulator or device that runs an iPhone and Apple Watch together 
    * Press the play button to run AirTime

* ### <b>Step 8:</b> Link playPORTAL Studio with AirTime
	
* ### <b>Step 8.1:</b> Insert Keys In An App File To Enable User Login
	* The Client ID, & Secrets tied to your application <b>NEED</b> to be hidden
	* Create a .gitignore file 
	
	```
	cd sway
	touch .gitignore
	```
	
	* Create a Keys.swift file inside your project directory
	* Copy your <b>Client ID</b> and your <b>Client Secret</b> from playPORTAL Studio
	* Define your keys inside the Keys.swift using the format below
		```
		 let cid = "CLIENT ID GOES HERE"
    		 let cse = "CLIENT SECRET GOES HERE"
		 let redirectURI = "REDIRECT URL GOES HERE"
                 let env = "SANDBOX"
		```
* ### <b>Step 8.2:</b>Open up the project in a different IDE
	* To edit your .gitignore open the project in either [Atom](https://atom.io/) or [VSCode](https://code.visualstudio.com/)
	* Add the filename Keys.swift to the .gitignore
	* Now that your keys are in a file, return to playPORTAL Studio
	* Create a Redirect URL using the name of your Studio app 
		```
		appname://redirect
		```

* ### <b>Step 8.3:</b>SSO Integration in XCode
	* Open XCode
	* Navigate to your app level settings and click on the info tab.
	* Add a new URL under the URL types section.
	* Input your app name into the <b>Identifier</b> and <b>URL Schemes</b>. See the picture below for refrence
	
	<img src="https://gyazo.com/bd73716f685418251fd814a1662b5cb8.png = 1500x1500" width="65%">
	
* ### <b>Step 8.4:</b> Create Sandbox Users For App
	* Go back to [playPORTAL Studio](https://studio.playportal.io)
	* Click on Sandbox
	* Generate a few users
	Tip: You can create kids by creating a Parent and adding a Kid
		
	<img src="https://gyazo.com/94f91ea85657586a11baa0c61182e531.png = 1500x1500" width="55%">
	
* ### <b>Step 9:</b> Develop! 
	* If you made it this far, great you are ready!!!
	* Within XCode, build the App
	* Use username and PW from playPORTAL Studio Step 8.4 to login
	* Good luck and have fun developing 
    
    
* ### <b>Got Stuck?</b> If you did on any of the steps listed here are some links to help!
    * Here is another cocoapods installation directions [link](https://iosdevcenters.blogspot.com/2015/12/how-to-install-cocoapods-in-xcode.html)
    * Read [this](https://github.com/joshnh/Git-Commands) to get a refresher on Git commands 


