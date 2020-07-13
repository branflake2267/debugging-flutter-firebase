# Debugging and Deploying a Flutter Web App to Firebase
Debugging and deploying a Flutter web app to Firebase

[![Build Status](https://travis-ci.org/branflake2267/debugging-flutter-web-dartwebserver-appengine.svg?branch=master)](https://travis-ci.org/branflake2267/debugging-flutter-web-dartwebserver-appengine)

[![Debugging Video Tutorial](https://img.youtube.com/vi/xxxx/0.jpg)](https://www.youtube.com/watch?v=xxxxx)
 

## Project Configuration 
| Setting | Value |
| --- | --- |
| Purpose | Debugging Flutter web app with dart web server hosted on App Engine |
| Client | Flutter web app |
| Server | Dart http web server |
| Client Language | Dart |
| Server Language | Dart |
| Architecture | Flutter/Dart |
| IDE | Visual Studio Code |
| CI | Travis CI |
| Hosting | App Engine Flex |
| License | GPL v3 |
| Tutorial | [Youtube Tutorial](https://youtu.be/xxxxx) |


## Debugging

### Debugging Client CLI

* Run `cd ./client` to change into the server directory.
* Run `pub get` to initialize the project.
* Run `flutter run -d chrome`

### Debugging with VS Code

* Use the VS Code Launcher `1. Launch Server`
* Use the VS Code Launcher `2. Launch Flutter Web App`

#### VS Code Endpoints

* http://localhost:54432/#/ - client 




## Init Reference

### Install Dart
The [dart tools](https://dart.dev/get-dart) are required to use this project. 

### Install VS Code Dart Plugin
Install the Dart VS Code plugin. 

Add the program launcher, to launch the web server.
```
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Launch Web Server",
      "program": "lib/server.dart",
      "request": "launch",
      "type": "dart"
    }
  ]
}
```

### Generate Flutter Web App

* [Generate a Flutter Web App Instructions](https://flutter.dev/docs/get-started/web)
* I ran `flutter create client` to create an app named client.


### Firebase Installation
Getting started with [Firebase](https://firebase.google.com/docs/hosting/quickstart). 

1. Run `firebase login`
2. Run `firebase init` - Select a project. Select a public www directory.
