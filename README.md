# ScreenWise

A Flutter package providing responsive widgets that automatically adapt to different screen sizes without manual if/else statements. This package is specifically designed to make your Flutter applications look great on both mobile and web platforms without writing platform-specific code.

## Features

- **ResponsiveRow**: A row that adapts to screen size and can display a different number of items based on screen width.
- **ResponsiveGrid**: A grid that adapts to screen size and changes the number of columns based on screen width.
- **AdaptiveColumn**: A column that can transform into a row on larger screens.
- **ResponsiveBuilder**: Allows creating completely different UIs for different screen sizes.
- **ResponsiveContainer**: A container that changes its size based on screen width.
- **ResponsiveScaffold**: A scaffold that adapts to screen size, with support for navigation rail on larger screens.
- **ResponsiveText**: Text that changes its size and style based on screen size.
- **ResponsiveValue**: A helper class to get different values based on screen size.
- **VerticalSpace**: A widget that creates vertical space with a specified height.
- **HorizontalSpace**: A widget that creates horizontal space with a specified width.

## Getting Started

Add the package to your pubspec.yaml file:

```yaml
dependencies:
  screenwise: ^0.0.5
```

Then run:

```bash
flutter pub get
```

## Web and Mobile Integration

This package is designed to work seamlessly across both web and mobile platforms. Here's how to optimize your app for both platforms:

### Understanding Screen Breakpoints

The package uses the following default breakpoints to determine the screen size:

- **Mobile**: < 600px
- **Tablet**: 600px - 900px
- **Desktop**: 900px - 1200px
- **Large Desktop**: 1200px - 1800px
- **Extra Large Desktop**: > 1800px

You can customize these breakpoints to match your specific design requirements (see [Customizing Breakpoints](#customizing-breakpoints) section).

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

### Spacing Widgets

```dart
// Add vertical space
VerticalSpace(height: 16.0)

// Add horizontal space
HorizontalSpace(width: 24.0)

// Example in a Column
Column(
  children: [
    Text('First item'),
    VerticalSpace(height: 16.0), // Adds 16 logical pixels of vertical space
    Text('Second item'),
  ],
)

// Example in a Row
Row(
  children: [
    Text('First item'),
    HorizontalSpace(width: 24.0), // Adds 24 logical pixels of horizontal space
    Text('Second item'),
  ],
)
```

## Web-Specific Considerations

When developing for the web, consider the following:

### 1. Drawer vs Navigation Rail

The `ResponsiveScaffold` widget automatically switches between a drawer (on mobile) and a navigation rail (on desktop) based on screen width:

```dart
ResponsiveScaffold(
  appBar: AppBar(title: Text('My App')),
  drawer: YourDrawerWidget(), // Used on mobile/tablet
  navigationRail: NavigationRail( // Used on desktop
    selectedIndex: _selectedIndex,
    onDestinationSelected: (int index) {
      setState(() {
        _selectedIndex = index;
      });
    },
    destinations: [
      NavigationRailDestination(
        icon: Icon(Icons.home),
        label: Text('Home'),
      ),
      // Add more destinations
    ],
  ),
  body: _pages[_selectedIndex],
)
```

### 2. Content Width Management

Use `ResponsiveContainer` to ensure content doesn't stretch too wide on large screens:

```dart
ResponsiveContainer(
  mobileWidthFraction: 1.0,    // Full width on mobile
  tabletWidthFraction: 0.8,    // 80% width on tablet
  desktopWidthFraction: 0.7,   // 70% width on desktop
  desktopMaxWidth: 1200,       // Never wider than 1200px
  child: YourContent(),
)
```

### 3. Different Layouts for Web and Mobile

Use `ResponsiveBuilder` to create completely different layouts:

```dart
ResponsiveBuilder(
  mobileBuilder: (context) => MobileLayout(),
  desktopBuilder: (context) => WebLayout(),
)
```

## Mobile-Specific Considerations

### 1. Stacking Elements

Use `AdaptiveColumn` to automatically switch between column and row layouts:

```dart
AdaptiveColumn(
  children: [
    UserProfileWidget(),
    UserStatsWidget(),
  ],
  // On mobile: stacked vertically
  // On desktop: arranged horizontally
  convertToRowOnDesktop: true,
)
```

### 2. Grid Layouts

Adjust the number of columns based on screen size:

```dart
ResponsiveGrid(
  mobileColumns: 1,       // Single column on mobile
  tabletColumns: 2,       // Two columns on tablet
  desktopColumns: 4,      // Four columns on desktop
  children: [
    // Your grid items
  ],
)
```

### 3. Text Scaling

Adjust text size based on device:

```dart
ResponsiveText(
  'Your text here',
  mobileStyle: TextStyle(fontSize: 14),
  tabletStyle: TextStyle(fontSize: 16),
  desktopStyle: TextStyle(fontSize: 18),
)
```

## Handling Orientation Changes

The package automatically responds to orientation changes. You can also check the current orientation using:

```dart
if (ScreenSizeUtils.isPortrait(context)) {
  // Portrait-specific logic
} else {
  // Landscape-specific logic
}
```

## Customizing Breakpoints

You can customize the default breakpoints using ResponsiveConfig:

```dart
void main() {
  // Set custom configuration
  ResponsiveConfig.setConfig(
    ResponsiveConfig(
      mobileBreakpoint: 480.0,      // Custom mobile breakpoint
      tabletBreakpoint: 800.0,      // Custom tablet breakpoint
      desktopBreakpoint: 1200.0,    // Custom desktop breakpoint
      largeDesktopBreakpoint: 1600.0, // Custom large desktop breakpoint
    ),
  );
  
  runApp(MyApp());
}
```

## Responsive Values for Any Property

Use the `ResponsiveValue` class to create responsive values for any property:

```dart
// Responsive padding
final padding = ResponsiveValue<EdgeInsets>(
  mobile: EdgeInsets.all(8),
  tablet: EdgeInsets.all(16),
  desktop: EdgeInsets.all(24),
).get(context);

// Responsive boolean flags
final showFeature = ResponsiveValue<bool>(
  mobile: false,  // Hide on mobile
  desktop: true,  // Show on desktop
).get(context);
```

Or use the convenient extension methods:

```dart
final fontSize = context.responsiveDouble(
  14.0,  // Mobile
  tablet: 16.0,  // Tablet
  desktop: 18.0,  // Desktop
);
```

## Best Practices

1. **Start Mobile-First**: Design for mobile first, then expand for larger screens.

2. **Test on Multiple Devices**: Always test your responsive layouts on various screen sizes.

3. **Use Breakpoints Consistently**: Stick to the same breakpoints throughout your app.

4. **Combine with MediaQuery**: For advanced cases, you can still use MediaQuery alongside this package.

5. **Consider Content Priority**: On smaller screens, focus on the most important content.

## Complete Example

For a complete example, please refer to the `/example` folder in the package.

## Contributing

Contributions are welcome! If you'd like to contribute, please create a pull request or open an issue on GitHub.

## Authors

- **Mohamed Draz** - *Initial work* - [draz26648](https://github.com/draz26648)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
