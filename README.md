# Flutter UI Component System & Design System

A comprehensive, reusable UI component system for Flutter applications, featuring dark/light theme support and responsive layouts.

## Features

- **Reusable Component Library**: Pre-built widgets like `AppButton`, `AppTextField`, and `AppCard` for consistent UI development.
- **Dynamic Theming**: Support for Light and Dark modes with a sophisticated color palette and modern typography (Outfit & Inter via Google Fonts).
- **Responsive Architecture**: Built-in `ResponsiveHelper` and `ResponsiveLayout` to handle Mobile, Tablet, and Desktop screen sizes seamlessly.
- **Clean Architecture**: Organized structure with dedicated layers for core functionality and modular UI.
- **GetX Integration**: Efficient state management and routing for a smooth user experience.

## Project Structure

```text
lib/
├── core/
│   ├── theme/           # App colors, typography, and theme definitions
│   ├── utils/           # Responsive helpers and other utilities
│   ├── widgets/         # Reusable UI components
│   └── localization/    # Multi-language support
├── modules/
│   └── design_system/   # Gallery of all UI components and theme showcase
└── routes/              # Application routing logic
```

## Getting Started

1. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

2. **Run the Application**:
   ```bash
   flutter run
   ```

## Usage

### Using Components
```dart
AppButton(
  text: 'Submit',
  onPressed: () => print('Pressed!'),
)
```

### Handling Responsiveness
```dart
ResponsiveLayout(
  mobile: MobileWidget(),
  tablet: TabletWidget(),
  desktop: DesktopWidget(),
)
```

## License
This project is licensed under the MIT License.