# Flutter Adaptive Layouts

A Flutter package providing responsive widgets that automatically adapt to different screen sizes without manual if/else statements.

## Features

- **ResponsiveRow**: A row that adapts to screen size and can display a different number of items based on screen width.
- **ResponsiveGrid**: A grid that adapts to screen size and changes the number of columns based on screen width.
- **AdaptiveColumn**: A column that can transform into a row on larger screens.
- **ResponsiveBuilder**: Allows creating completely different UIs for different screen sizes.
- **ResponsiveContainer**: A container that changes its size based on screen width.
- **ResponsiveScaffold**: A scaffold that adapts to screen size, with support for navigation rail on larger screens.
- **ResponsiveText**: Text that changes its size and style based on screen size.
- **ResponsiveValue**: A helper class to get different values based on screen size.

## Getting Started

Add the package to your pubspec.yaml file:

```yaml
dependencies:
  flutter_adaptive_layouts: ^0.0.1
```

Then run:

```bash
flutter pub get
```

## Usage

### ResponsiveRow

```dart
ResponsiveRow(
  children: [
    Container(width: 100, height: 100, color: Colors.red),
    Container(width: 100, height: 100, color: Colors.blue),
    Container(width: 100, height: 100, color: Colors.green),
    Container(width: 100, height: 100, color: Colors.yellow),
  ],
  mobileItemCount: 1,  // Show only one item on small screens
  tabletItemCount: 2,  // Show two items on medium screens
  desktopItemCount: 4, // Show all items on large screens
  spacing: 16.0,       // Spacing between items
  wrap: true,          // Wrap items when they don't fit
)
```

### ResponsiveGrid

```dart
ResponsiveGrid(
  children: [
    Container(color: Colors.red),
    Container(color: Colors.blue),
    Container(color: Colors.green),
    Container(color: Colors.yellow),
  ],
  mobileColumns: 1,       // One column on small screens
  tabletColumns: 2,       // Two columns on medium screens
  desktopColumns: 4,      // Four columns on large screens
  largeDesktopColumns: 6, // Six columns on extra large screens
  crossAxisSpacing: 16.0, // Spacing between columns
  mainAxisSpacing: 16.0,  // Spacing between rows
)
```

### AdaptiveColumn

```dart
AdaptiveColumn(
  children: [
    Container(width: 100, height: 100, color: Colors.red),
    Container(width: 100, height: 100, color: Colors.blue),
  ],
  spacing: 16.0,                // Spacing between items in column
  convertToRowOnDesktop: true,  // Convert to row on desktop
  rowSpacing: 24.0,             // Spacing between items when converted to row
)
```

### ResponsiveBuilder

```dart
ResponsiveBuilder(
  mobileBuilder: (context) => MobileView(),
  tabletBuilder: (context) => TabletView(),
  desktopBuilder: (context) => DesktopView(),
)
```

Or use ResponsiveWidget for the same result in a simpler way:

```dart
ResponsiveWidget(
  mobile: MobileView(),
  tablet: TabletView(),
  desktop: DesktopView(),
)
```

### ResponsiveContainer

```dart
ResponsiveContainer(
  mobileWidthFraction: 1.0,    // 100% of screen width on mobile
  tabletWidthFraction: 0.8,    // 80% of screen width on tablet
  desktopWidthFraction: 0.6,   // 60% of screen width on desktop
  desktopMaxWidth: 1200,       // Maximum width on desktop
  child: YourWidget(),
)
```

### ResponsiveScaffold

```dart
ResponsiveScaffold(
  appBar: AppBar(title: Text('App Title')),
  body: YourMainContent(),
  drawer: YourDrawer(),            // Shows as drawer on small screens
  navigationRail: YourNavRail(),   // Shows as side navigation on large screens
  bottomNavigationBar: YourBottomNav(), // Only shows on small screens
)
```

### ResponsiveText

```dart
ResponsiveText(
  'Responsive Text',
  mobileStyle: TextStyle(fontSize: 14),
  tabletStyle: TextStyle(fontSize: 16),
  desktopStyle: TextStyle(fontSize: 18),
)
```

### ResponsiveValue

```dart
// Using ResponsiveValue directly
final padding = ResponsiveValue<EdgeInsets>(
  mobile: EdgeInsets.all(8),
  tablet: EdgeInsets.all(16),
  desktop: EdgeInsets.all(24),
).get(context);

// Or using BuildContext extensions
final padding = context.responsiveEdgeInsets(
  EdgeInsets.all(8),
  tablet: EdgeInsets.all(16),
  desktop: EdgeInsets.all(24),
);

final fontSize = context.responsiveDouble(
  14.0,
  tablet: 16.0,
  desktop: 18.0,
);
```

## Customizing Breakpoints

You can customize the default breakpoints using ResponsiveConfig:

```dart
void main() {
  // Set custom configuration
  ResponsiveConfig.setConfig(
    ResponsiveConfig(
      mobileBreakpoint: 480.0,
      tabletBreakpoint: 800.0,
      desktopBreakpoint: 1200.0,
      largeDesktopBreakpoint: 1600.0,
    ),
  );
  
  runApp(MyApp());
}
```

## Complete Example

For a complete example, please refer to the `/example` folder in the package.

## Contributing

Contributions are welcome! If you'd like to contribute, please create a pull request or open an issue on GitHub.
