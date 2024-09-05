Singleton button for quick hacks and tests involving disparate parts of a program and you can't be bothered to wire it up "right".

## Features

Address button states via global strings.  Check if button's been pressed since last time you checked.

## Usage

```dart
void testBuild() {
  SingletonButton("no callback", child: Text("no callback"));
  SingletonButton("yes callback", child: Text("yes callback"), onPressed: () {
    log("declaration callback hit");
  },);
}

void test() {
  // Somewhere else, maybe asynchronous
  if (SingletonButton.get("no callback").qHasBeenClicked()) {
    log("no-callback was clicked since last time");
  }
  if (SingletonButton.get("yes callback").qHasBeenClicked()) {
    log("yes-callback was clicked since last time");
  }
}
```

## Additional information

MIT license.

-Erhannis