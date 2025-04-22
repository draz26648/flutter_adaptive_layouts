import 'package:flutter/material.dart';
import 'package:flutter_adaptive_layouts/flutter_adaptive_layouts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Widget Toolkit Demo',
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
        title: const Text('Responsive Widget Toolkit Demo'),
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
                'القائمة',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('الصفحة الرئيسية'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('الإعدادات'),
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
            label: Text('الرئيسية'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.settings),
            label: Text('الإعدادات'),
          ),
        ],
        onDestinationSelected: (int index) {},
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'الإعدادات',
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
                'مرحبًا بك في مكتبة Responsive Widget Toolkit!',
                mobileStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                tabletStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                desktopStyle: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              
              // Responsive Container Example
              const Text('ResponsiveContainer مثال على', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                  'هذا الحاوية ستتكيف مع حجم الشاشة. على الهاتف المحمول، ستأخذ 100% من العرض. على الجهاز اللوحي، ستأخذ 80%. على سطح المكتب، ستأخذ 60%.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 24),
              
              // Responsive Row Example
              const Text('ResponsiveRow مثال على', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ResponsiveRow(
                mobileItemCount: 1,
                tabletItemCount: 2,
                desktopItemCount: 4,
                spacing: 16,
                children: [
                  _buildColoredBox(Colors.red, 'عنصر 1'),
                  _buildColoredBox(Colors.blue, 'عنصر 2'),
                  _buildColoredBox(Colors.green, 'عنصر 3'),
                  _buildColoredBox(Colors.amber, 'عنصر 4'),
                ],
              ),
              const SizedBox(height: 24),
              
              // Responsive Grid Example
              const Text('ResponsiveGrid مثال على', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                  _buildColoredBox(Colors.purple, 'عنصر 1'),
                  _buildColoredBox(Colors.teal, 'عنصر 2'),
                  _buildColoredBox(Colors.orange, 'عنصر 3'),
                  _buildColoredBox(Colors.pink, 'عنصر 4'),
                  _buildColoredBox(Colors.indigo, 'عنصر 5'),
                  _buildColoredBox(Colors.lime, 'عنصر 6'),
                ],
              ),
              const SizedBox(height: 24),
              
              // Adaptive Column Example
              const Text('AdaptiveColumn مثال على', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              AdaptiveColumn(
                spacing: 16,
                convertToRowOnDesktop: true,
                children: [
                  _buildColoredBox(Colors.deepOrange, 'عنصر 1', height: 100),
                  _buildColoredBox(Colors.deepPurple, 'عنصر 2', height: 100),
                ],
              ),
              const SizedBox(height: 24),
              
              // Responsive Builder Example
              const Text('ResponsiveBuilder مثال على', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ResponsiveBuilder(
                mobileBuilder: (context) => _buildColoredBox(
                  Colors.red.shade300, 
                  'عرض الهاتف المحمول',
                  height: 100,
                ),
                tabletBuilder: (context) => _buildColoredBox(
                  Colors.green.shade300, 
                  'عرض الجهاز اللوحي',
                  height: 100,
                ),
                desktopBuilder: (context) => _buildColoredBox(
                  Colors.blue.shade300, 
                  'عرض سطح المكتب',
                  height: 100,
                ),
              ),
              const SizedBox(height: 24),
              
              // Responsive Widget Example
              const Text('ResponsiveWidget مثال على', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ResponsiveWidget(
                mobile: _buildColoredBox(
                  Colors.red.shade700, 
                  'عرض الهاتف المحمول',
                  height: 100,
                ),
                tablet: _buildColoredBox(
                  Colors.green.shade700, 
                  'عرض الجهاز اللوحي',
                  height: 100,
                ),
                desktop: _buildColoredBox(
                  Colors.blue.shade700, 
                  'عرض سطح المكتب',
                  height: 100,
                ),
              ),
              const SizedBox(height: 24),
              
              // Screen Size Info
              const Text('معلومات حجم الشاشة الحالي:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                        Text('نوع الشاشة: $screenType'),
                        Text('العرض: ${width.toStringAsFixed(1)}'),
                        Text('الارتفاع: ${height.toStringAsFixed(1)}'),
                        Text('الاتجاه: $orientation'),
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
