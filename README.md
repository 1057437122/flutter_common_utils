### Flutter common utils

This repository contains many common utils of flutter.

### Usage

in your pubspec.yml file, add this repo as a dependency like this:

```
dependencies:
  flutter_common_utils:
    git:
      url: https://github.com/1057437122/flutter_common_utils.git
      ref: master # branch name

```

and use the function in your dart file:

```
import 'package:flutter_common_utils/common_utils.dart';

// any other codes
logData("use common utils to log data");
```

### Functions

#### for string

1. String cutText(String text, int length): cut `text` into `length` leng, `...` will show if `text` is longer than `length`.

2. String randomId(): return a uuidV4 string.

3. logData(String msg): print msg to console.

4. bool isPhoneCall(String input): use `Regexp` to test if an input is a format like this: `tel:+34666666666`.

5. bool isMailCall(String input) : use `Regexp` to test if an input is a format like this `mailto:lecy.cc.app@gmail.com`

6. bool isSmsCall(String input): use `Regexp` to test if an input is a format like this `smsto:+34666666666:nice tomeet you`

### for system

1. setPhonePortrail({bool rotate = true, bool hideMenu = false}): set phone to portrail mode.

2. setPhoneLandscape({bool rotate = true}): set phone to landscape mode.

3. showToast(String msg) : show toast with `fluttertoast` package.

### for time

1. int getCurrentTimestampInMillionSecond(): function name is the explain

2. String formatDateFromTimestamp(int timestamp) : format timestamp to format `yyyy-MM-dd`

## more shotcuts will be added.
