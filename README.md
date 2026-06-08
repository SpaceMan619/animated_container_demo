# AnimatedContainer Demo

My widget for this presentation is Flutter's `AnimatedContainer` — a container that
animates itself smoothly whenever you change its size, colour, or shape, without any
animation controller.

I built a small expandable card to show it off. The card starts small and light, and
when you tap it the width, height and colour all change together in one smooth motion.
There's also a slider so I can change the animation speed live during the demo.

## Screenshots

Collapsed (default) and expanded states:

| Collapsed | Expanded |
|-----------|----------|
| ![Collapsed card](screenshots/collapsed.png) | ![Expanded card](screenshots/expanded.png) |

## How to run

You need the Flutter SDK installed. Then:

```bash
flutter pub get
flutter run
```

Pick any device when it asks (I demoed it on macOS / Chrome). Tap the card to expand or
collapse it, and drag the slider to change how long the animation takes.

## The three attributes I demonstrate

All three live on the `AnimatedContainer` in `lib/main.dart`.

**1. `duration`** — default `500ms` in my code. This is the only one I change live, using
the slider (100ms up to 2000ms). It sets how long the whole transition takes. At 2000ms
you can watch the card crawl open; at 150ms it's almost instant. You'd adjust this to get
the feel you want — quick for everyday UI, slower when you want to draw attention.

**2. `width`** — goes from `200` collapsed to `320` expanded. When the boolean flips on
tap, AnimatedContainer tweens the width to the new value instead of snapping. Changing it
makes the card grow sideways, which is how I make room for more content.

**3. `height`** — goes from `120` collapsed to `260` expanded, the same way. It grows the
card downward. Together with width it gives that "card opening up" feel you see in
notification cards and expandable list items.

The key idea is that I never write an animation by hand. I just change these values
inside `setState`, and AnimatedContainer animates the difference for me (this is what
Flutter calls an *implicit* animation).

## Project structure

- `lib/main.dart` — the whole app: the expandable card and the duration slider.
- `test/widget_test.dart` — a widget test that taps the card and checks it expands.
