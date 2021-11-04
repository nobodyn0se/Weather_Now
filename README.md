# bloc_app

A simple Flutter app built using BLoC architecture.

## Dynamic Theming

The user can toggle between dark and light themes by clicking the bulb icon at the top right of the screen.

Business logic has been separated completely from the presentation layer. ThemeToggled is the event generated on button click and sent to the Bloc which then toggles the state (theme in this case). Everything is layered so that logical aspects aren't exposed to the widgets. 

state.themeData contains information regarding the current theme, which is passed to the theme: attribute of MaterialApp. Every click will toggle this state and switch the theme making it easier to not specify theme specific color attributes everywhere.

The app will be updated to display the current weather of an input city shortly.
