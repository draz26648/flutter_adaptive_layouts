import 'package:flutter/material.dart';
import 'package:screenwise/screenwise.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScreenWise Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      appBar: AppBar(
        title: const Text('ScreenWise Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Home Page'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      navigationRail: NavigationRail(
        selectedIndex: 0,
        destinations: const [
          NavigationRailDestination(
            icon: Icon(Icons.home),
            label: Text('Home'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.settings),
            label: Text('Settings'),
          ),
        ],
        onDestinationSelected: (int index) {},
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: 0,
        onTap: (int index) {},
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Responsive Text Example
              const ResponsiveText(
                'Welcome to ScreenWise!',
                mobileStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                tabletStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                desktopStyle: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              
              // Responsive Container Example
              const Text('ResponsiveContainer Example', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ResponsiveContainer(
                mobileWidthFraction: 1.0,
                tabletWidthFraction: 0.8,
                desktopWidthFraction: 0.6,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'This container will adapt to the screen size. On mobile, it will take 100% of the width. On tablet, it will take 80%. On desktop, it will take 60%.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 24),
              
              // Responsive Row Example
              const Text('ResponsiveRow Example', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ResponsiveRow(
                mobileItemCount: 1,
                tabletItemCount: 2,
                desktopItemCount: 4,
                spacing: 16,
                children: [
                  _buildColoredBox(Colors.red, 'Item 1'),
                  _buildColoredBox(Colors.blue, 'Item 2'),
                  _buildColoredBox(Colors.green, 'Item 3'),
                  _buildColoredBox(Colors.amber, 'Item 4'),
                ],
              ),
              const SizedBox(height: 24),
              
              // Responsive Grid Example
              const Text('ResponsiveGrid Example', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ResponsiveGrid(
                mobileColumns: 1,
                tabletColumns: 2,
                desktopColumns: 3,
                largeDesktopColumns: 4,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.5,
                children: [
                  _buildColoredBox(Colors.purple, 'Item 1'),
                  _buildColoredBox(Colors.teal, 'Item 2'),
                  _buildColoredBox(Colors.orange, 'Item 3'),
                  _buildColoredBox(Colors.pink, 'Item 4'),
                  _buildColoredBox(Colors.indigo, 'Item 5'),
                  _buildColoredBox(Colors.lime, 'Item 6'),
                ],
              ),
              const SizedBox(height: 24),
              
              // Adaptive Column Example
              const Text('AdaptiveColumn Example', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              AdaptiveColumn(
                spacing: 16,
                convertToRowOnDesktop: true,
                children: [
                  _buildColoredBox(Colors.deepOrange, 'Item 1', height: 100),
                  _buildColoredBox(Colors.deepPurple, 'Item 2', height: 100),
                ],
              ),
              const SizedBox(height: 24),
              
              // Responsive Builder Example
              const Text('ResponsiveBuilder Example', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ResponsiveBuilder(
                mobileBuilder: (context) => _buildColoredBox(
                  Colors.red.shade300, 
                  'Mobile View',
                  height: 100,
                ),
                tabletBuilder: (context) => _buildColoredBox(
                  Colors.green.shade300, 
                  'Tablet View',
                  height: 100,
                ),
                desktopBuilder: (context) => _buildColoredBox(
                  Colors.blue.shade300, 
                  'Desktop View',
                  height: 100,
                ),
              ),
              const SizedBox(height: 24),
              
              // Responsive Widget Example
              const Text('ResponsiveWidget Example', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ResponsiveWidget(
                mobile: _buildColoredBox(
                  Colors.red.shade700, 
                  'Mobile View',
                  height: 100,
                ),
                tablet: _buildColoredBox(
                  Colors.green.shade700, 
                  'Tablet View',
                  height: 100,
                ),
                desktop: _buildColoredBox(
                  Colors.blue.shade700, 
                  'Desktop View',
                  height: 100,
                ),
              ),
              const SizedBox(height: 24),
              
              // Screen Size Info
              const Text('Current Screen Size Information:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Builder(
                builder: (context) {
                  final screenType = ScreenSizeUtils.getScreenSizeType(context);
                  final width = MediaQuery.of(context).size.width;
                  final height = MediaQuery.of(context).size.height;
                  final orientation = ScreenSizeUtils.getOrientation(context);
                  
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Screen Type: $screenType'),
                        Text('Width: ${width.toStringAsFixed(1)}'),
                        Text('Height: ${height.toStringAsFixed(1)}'),
                        Text('Orientation: $orientation'),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColoredBox(Color color, String text, {double height = 150}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
