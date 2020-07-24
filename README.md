# Debugging and Deploying a Flutter Web and Mobile App with Firebase

[![Build Status](https://travis-ci.org/branflake2267/debugging-flutter-firebase.svg?branch=master)](https://travis-ci.org/branflake2267/debugging-flutter-firebase)

[![Debugging Video Tutorial](https://img.youtube.com/vi/xxxx/0.jpg)](https://www.youtube.com/watch?v=xxxxx)
 

## Project Configuration 
| Setting | Value |
| --- | --- |
| Purpose | Debugging and deploying a Flutter web app to Firebase. Fetching data from Firebase. Debugging on Android. |
| Client | Flutter web app, Android/iOS mobiel app |
| Server | Firebase|
| Client Language | Dart |
| Server Language | Firebase |
| Architecture | Flutter/Dart |
| IDE | Visual Studio Code |
| CI | Travis CI |
| Hosting | Firebase |
| License | GPL v3 |
| Tutorial | [Youtube Tutorial](https://youtu.be/xxxxx) |


## Debugging

### Debugging Client CLI

* Run `cd ./client` to change into the server directory.
* Run `pub get` to initialize the project.
* Run `flutter run -d chrome`

### Debugging with VS Code

**Web App**
* Use the VS Code Launcher `Launch Flutter - Web`

**Mobile App**
* Use the VS Code Launcher `Launch Flutter - Phone`



## Init Reference

### Install Dart
The [dart tools](https://dart.dev/get-dart) are required to use this project. 

### Install VS Code Dart Plugin
Install the Dart VS Code plugin. And configure the launchers.

```
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Launch Flutter - Web",
      "request": "launch",
      "type": "dart",
      "program": "client/lib/main.dart",
      "args": [
        "-d", "chrome"
      ]
    },

    {
      "name": "Launch Flutter - Phone",
      "request": "launch",
      "type": "dart",
      "program": "client/lib/main.dart",
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
