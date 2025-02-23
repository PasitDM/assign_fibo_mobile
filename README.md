# PST Fibo List App - Flutter App  

## 🚀 Overview  
This project is an **assignment for state management in Flutter**. It demonstrates how to manage state using **MVVM + ChangeNotifier + AnimatedBuilder**, without using any third-party state management libraries.  

## 🛠 Tech Stack  
- **Flutter SDK**: 3.29.0  
- **Dart SDK**  
- **State Management**: ChangeNotifier + AnimatedBuilder (MVVM)  

## 🎯 Features  
- **Scrollable Widget**: A list of at least **40 Fibonacci numbers** that allows scrolling.  
- **Display Widget**: Each Fibonacci number is displayed alongside a symbol/icon representing its type (**square, cross, circle**).  
- **Tap Functionality**:  
  - Tapping a number displays a **BottomSheet** with items of the same type.  
  - Tapping an item moves it back to the main list, highlights it, and scrolls to it.  

---

### Installation & Run
```sh
git clone https://github.com/yourusername/fibonacci_list_app.git
cd assign_fibo_mobile
fvm use 3.29.0
fvm flutter pub get
fvm flutter run
```

### Running Tests
1. Unit Tests:
    fvm flutter test test/presentation/viewmodel/fibo_viewmodel_test.dart
    Tests logic in FiboViewModel to verify that Fibonacci numbers move correctly between lists.

2. Widget Tests:
    fvm flutter test test/widget_test.dart
    Ensures UI elements function correctly (e.g., tapping a number opens a BottomSheet).

3. Golden Tests:
```
  # Create golden images
  fvm flutter test --update-goldens
  # Run golden tests
  fvm flutter test test/golden_test/fibo_screen_golden_test.dart
```
  Verifies that the UI matches expected screenshots.

4. Integration Tests:
    fvm flutter test test/integration_test/integration_test.dart
  Simulates user interactions to check if the entire app functions correctly.

5. Run All Test
    fvm flutter test

## Project Structure
```
assign_fibo_mobile/
├── lib/
│   ├── core/
│   │   └── theme/
│   │       ├── app_colors.dart
│   │       └── app_theme.dart
│   ├── features/
│   │   └── fibo/
│   │       ├── presentation/
│   │       │   ├── models/
│   │       │   │   └── fibo_model_ui.dart
│   │       │   ├── screens/
│   │       │   │   └── fibo_screen.dart
│   │       │   ├── viewmodel/
│   │       │   │   └── fibo_viewmodel.dart
│   │       │   └── widgets/
│   │       │       └── fibo_list_tile.dart
│   └── main.dart
├── test/
│   ├── golden_test/
│   │   ├── fibo_screen_golden_test.dart
│   │   └── golden/
│   │       └── fibo_screen.png
│   ├── integration_test/
│   │   └── integration_test.dart
│   ├── presentation/
│   │   └── viewmodel/
│   │       └── fibo_viewmodel_test.dart
│   └── widget_test.dart
```

## The project uses the MVVM pattern with ChangeNotifier and AnimatedBuilder for state management.
### 4 Examples
### 1. Example of Display list Fibonacci Display list Fibonacci  
![Mobile Main](assets/images/ex_display_fibo.gif)  

### 2. Example of added item only the same type Added item only the same type  
![Mobile Main](assets/images/ex_add_same_type.gif)  

### 3. Example of When scrolling to highlighted one when showing modal Scrolling to highlighted item  
![Mobile Main](assets/images/ex_scrolling_highlight_model.gif)  

### 4. Example of what to do when pop When pop  
![Mobile Main](assets/images/ex_when_pop.gif)  

## Coverage Report  
![Coverage Report](assets/images/coverage_report.png)  

