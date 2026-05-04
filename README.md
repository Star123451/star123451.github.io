# peg86
peg86 uses [v86](https://github.com/copy/v86) to emulate an x86 CPU running ReactOS to play Peggle Deluxe and its variants in your browser.

[![Play Peggle Deluxe](https://img.shields.io/badge/Play%20Peggle%20Deluxe-orange)](https://sinceohsix.github.io/peg86)
[![Play Peggle Nights](https://img.shields.io/badge/Play%20Peggle%20Nights-darkblue)](https://sinceohsix.github.io/peg86?nights)
[![Play Peggle Extreme](https://img.shields.io/badge/Play%20Peggle%20Extreme-grey)](https://sinceohsix.github.io/peg86?extreme)
[![Play Peggle WoW Edition](https://img.shields.io/badge/Play%20Peggle%20WoW%20Edition-purple)](https://sinceohsix.github.io/peg86?wow)
[![Play Peggle WoW Edition](https://img.shields.io/badge/Play%20Pego%20(Prototype)-blue)](https://sinceohsix.github.io/peg86?proto)

## Compatibility
Compatibility is widely untested. If you have a decent computer, it *should* work. Mobile is supported (use the input field to type) but performace will not be as good as using a PC/Mac.

| Device            | Browser | OS Version      | Runs? |
| :---------------: | :-----: | :-------------: | :---: |
| M2 Mac Mini       | Safari  | 26.3.1          | Great |
| Macbook Neo       | Safari  | 26.3.2          | Great |
| iPhone 16 Pro Max | Safari  | 26.1            | Great |
| iPhone 16         | Safari  | 26.1            | Great |
| iPad 10th Gen     | Safari  | 26.1            | Good  |
| Surface Pro 4     | Edge    | Windows 10 22H2 | Bad.  |

## Known Quirks
- No game audio. ReactOS doesn't support audio in v86 (See [v86 Issue #1007](https://github.com/copy/v86/issues/1007)). This can only be fixed by using a different operating system which I am looking into.
- Game sometimes runs too fast. From my testing, this has only happened with Nights on my Mac mini.
- Wow Edition is much slower than usual in the first boot. Gameplay wise, it performs the same as the other games.

## Additional Info
Peggle Prototype (Pego) can be found [here](https://archive.org/details/pego-deluxe-2006-08-03-beta-english.-7z). Read the description of the archive.org page for more details and debug controls.
