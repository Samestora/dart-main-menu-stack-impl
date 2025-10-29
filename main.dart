import 'dart:io';

class MainMenu {
  List<String> menuItems;
  final List<String> _navigationStack = ["Landing Page"];
  String get currentMenu => _navigationStack.last;

  MainMenu(this.menuItems);

  /// Clears the terminal screen. Works on Windows, macOS, and Linux.
  void clearTerminal() {
    if (Platform.isWindows) {
      // This is a fallback. For modern Windows terminals, the ANSI escape code works.
      Process.runSync('cmd', ['/c', 'cls']);
    } else {
      // Uses ANSI escape codes to clear the screen and reset the cursor.
      stdout.write('\x1B[2J\x1B[1;1H');
    }
  }
  
  bool displayMenu() {
    print('--- (${currentMenu}) ---');
    print('-1. To Go Back');
    print('--------------------');

    for (var index = 0; index < menuItems.length; index++) {
      print('$index. ${menuItems[index]}');
    }

    stdout.write('\nEnter your choice: ');
    String? rawInput = stdin.readLineSync();

    if (rawInput == null || rawInput.isEmpty) {
      print('Invalid input. Please try again.');
      return true;
    }

    int? input = int.tryParse(rawInput);

    if (input == null) {
      print('Invalid input. Please enter a number.');
      return true;
    }

    // Inputs
    if (input == -1) {
      goBack();
    } else {
      if (menuItems[input].toLowerCase() == 'exit') {
        return false;
      }
      navigation(input);
    }
    return true;
  }

  void navigation(int menuIndex) {
    if (menuIndex >= 0 && menuIndex < menuItems.length) {
      final destination = menuItems[menuIndex];
      print('Navigating to $destination...');
      _navigationStack.add(destination);
    } else {
      print('Invalid menu index');
    }
  }

  void goBack() {
    if (_navigationStack.length > 1) {
      _navigationStack.removeLast();
      print("Going back to $currentMenu...");
    } else {
      print('Already at the Landing Page.');
    }
  }
}

void main() {
  final mainMenu = MainMenu(['Home', 'Settings', 'About', 'Exit']);
  bool isRunning = true;

  while (isRunning) {
    mainMenu.clearTerminal();
    isRunning = mainMenu.displayMenu();
  }

  print("Program exited. Goodbye!");
}
