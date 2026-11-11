# Ahmed Tamer Portfolio

A performance-focused Flutter Web portfolio for Ahmed Tamer Ahmed, Mobile
Software Engineer.

[View Centerly in the published portfolio](https://atamer7112002.github.io/flutter_portfolio/#centerly)

## Run locally

```sh
flutter pub get
flutter run -d chrome
```

## Production build

```sh
flutter build web --release
```

## Deploy

```sh
firebase deploy --only hosting
```

The site uses short, one-shot entrance transitions and honors the platform's
reduced-motion preference. Continuous particle and scroll-indicator animations
were intentionally removed to keep scrolling and idle rendering lightweight.
