# Weather Now

A simple Flutter app built using BLoC architecture to display weather info for major cities.

## Custom temperature and humidity bands

- The app contains two horizontal bands - temperature and humidity. 
- The temperature indicator contains a stacked container with gradient colors which reveals sections of the band according to current temperature. Colder temp -> white/bluish, warmer temp -> green/yellow, hotter temp -> orange/red
- Humidity indicator contains a static blue colored stacked container that varies with width according to humidity levels.

## Dynamic Theming

- The user can toggle between dark and light themes by clicking the bulb icon at the top right of the screen.
- Business logic has been separated completely from the presentation layer. ThemeToggled is the event generated on button click and sent to the Bloc which then toggles the state (theme in this case). Everything is layered so that logical aspects aren't exposed to the widgets. 
- state.themeData contains information regarding the current theme, which is passed to the theme: attribute of MaterialApp. Every click will toggle this state and switch the theme making it easier to not specify theme specific color attributes everywhere.

## Installation
```
git clone https://github.com/nobodyn0se/Weather_Now.git
cd Weather_Now
```

### Flutter SDK must be installed on your system

## Run App
Start an emulator instance or connect your mobile device, then run the following command
```
flutter run
```
