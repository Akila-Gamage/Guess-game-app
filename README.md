# Guess the Answer Game

This is an iOS application developed as a university project for a "Guess the Answer" game. The app is built using Swift and employs the MVVM (Model-View-ViewModel) architectural pattern.

**Game Overview:**

* **Gameplay:**
    * The app presents the user with a series of randomly generated math questions.
    * The user inputs their answer.
    * If the answer is correct, the user's score increases.
    * If the answer is incorrect or the user skips the question, the score decreases.
* **Features:**
    * **Customizable Theme:** Users can change the app's theme color to personalize their gaming experience.
    * **Adjustable Font Size:** Users can adjust the font size for better readability.

**Technical Details:**

* **Programming Language:** Swift
* **Architecture:** MVVM (Model-View-ViewModel)
* **Development Environment:** Xcode

**Project Structure:**

* **Model:** Contains data models for game data, user settings, etc.
* **View:** Responsible for the user interface and user interactions.
* **ViewModel:** Acts as an intermediary between the View and Model, handling data transformations and business logic.

**To Run the App:**

1. Clone this repository.
   
     ```bash
   git clone https://github.com/Akila-Gamage/Guess-game-app.git
2. Open the project in Xcode.
3. Build and run the app on a simulator or a physical iOS device.

**Future Enhancements:**

* Implement game difficulty levels.
* Add sound effects and background music.
* Introduce a leaderboard to track high scores.
* Incorporate user profiles.
* Expand the question types to include other subjects (e.g., history, geography).
