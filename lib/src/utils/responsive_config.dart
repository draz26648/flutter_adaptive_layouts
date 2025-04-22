/// Configuration class for responsive widgets
class ResponsiveConfig {
  /// Default breakpoint for mobile screens
  final double mobileBreakpoint;

  /// Default breakpoint for tablet screens
  final double tabletBreakpoint;

  /// Default breakpoint for desktop screens
  final double desktopBreakpoint;

  /// Default breakpoint for large desktop screens
  final double largeDesktopBreakpoint;

  /// Default configuration for responsive widgets
  static final ResponsiveConfig defaultConfig = ResponsiveConfig();

  /// Current active configuration
  static ResponsiveConfig _instance = defaultConfig;

  /// Get the current active configuration
  static ResponsiveConfig get instance => _instance;

  /// Set a new configuration as the active one
  static void setConfig(ResponsiveConfig config) {
    _instance = config;
  }

  /// Constructor with default values
  const ResponsiveConfig({
    this.mobileBreakpoint = 600.0,
    this.tabletBreakpoint = 900.0,
    this.desktopBreakpoint = 1200.0,
    this.largeDesktopBreakpoint = 1800.0,
  });
}
