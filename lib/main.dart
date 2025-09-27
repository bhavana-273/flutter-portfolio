import 'package:flutter/material.dart';

void main() {
  runApp(const MyPortfolioApp()); // Added const
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Portfolio",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Arial",
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.brown.shade300, // warm brown buttons
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            shape: const StadiumBorder(),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/about': (context) => const AboutPage(),
        '/projects': (context) => const ProjectsPage(),
      },
    );
  }
}

// ✅ Gradient Background (Creamy)
class GradientBackground extends StatelessWidget {
  final Widget child;
  const GradientBackground({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFFF5E1), // light cream
            Color(0xFFFFEFD5), // peach-puff
            Colors.white,      // soft white
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }
}

// ✅ Home Page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GradientBackground(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                const SizedBox(height: 20),
                Text(
                  "Bhavana",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown.shade800,
                  ),
                ),
                Text(
                  "Flutter Developer",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.brown.shade600,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/about'),
                  icon: const Icon(Icons.person),
                  label: const Text("About Me"),
                ),
                const SizedBox(height: 15),
                ElevatedButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/projects'),
                  icon: const Icon(Icons.work),
                  label: const Text("Projects"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ✅ About Page
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person_pin,
                    size: 100, color: Colors.brown.shade700),
                const SizedBox(height: 20),
                Text(
                  "I am a Flutter developer.\nI love to design apps.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.brown.shade900),
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.home),
                  label: const Text("Back to Home"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ✅ Projects Page (Cream Gradient Cards)
class ProjectsPage extends StatelessWidget {
  final List<Map<String, dynamic>> projects = const [
    {"icon": Icons.cloud, "title": "Weather App"},
    {"icon": Icons.shopping_cart, "title": "E-commerce UI"},
    {"icon": Icons.music_note, "title": "Music Player"},
    {"icon": Icons.code, "title": "ReactJS App"},
  ];

  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              "My Projects",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.brown.shade800,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ...projects.map(
              (project) => Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.brown.shade200, Colors.brown.shade100],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(2, 3),
                    )
                  ],
                ),
                child: ListTile(
                  leading: Icon(project["icon"], color: Colors.white),
                  title: Text(
                    project["title"],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.home),
              label: const Text("Back to Home"),
            ),
          ],
        ),
      ),
    );
  }
}
