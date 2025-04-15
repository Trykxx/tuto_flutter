import 'package:flutter/material.dart'; // Importe le package Flutter pour utiliser les widgets Material Design.

void main() {
  runApp(const MyApp()); // Exécute l'application Flutter en lançant MyApp comme widget racine.
}

class MyApp extends StatelessWidget { // Déclare MyApp, un widget immuable qui étend StatelessWidget.
  const MyApp({super.key}); // Constructeur de MyApp avec une clé optionnelle pour l'identification du widget.

  @override
  Widget build(BuildContext context) { // Méthode qui construit l'interface utilisateur.
    return MaterialApp( // Retourne une application basée sur Material Design.
      debugShowCheckedModeBanner: false, // Supprime la bannière "debug" en haut à droite.
      title: 'Flutter Demo', // Définit le titre de l'application.
      theme: ThemeData( // Définit le thème de l'application.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue), // Définit un jeu de couleurs basé sur le vert.
      ),
      home: const MyHomePage(title: 'Ma première application'), // Définit MyHomePage comme la page d'accueil.
    );
  }
}

class MyHomePage extends StatefulWidget { // Déclare un widget avec un état mutable.
  const MyHomePage({super.key, required this.title}); // Constructeur de MyHomePage avec un paramètre obligatoire `title`.
  final String title; // Déclare un champ `title` de type String.

  @override
  State<MyHomePage> createState() => _MyHomePageState(); // Crée l'état associé au widget.
}

class _MyHomePageState extends State<MyHomePage> { // Déclare l'état du widget MyHomePage.

  String name = "";

  @override
  Widget build(BuildContext context) { // Construit l'interface utilisateur de la page.
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,// Scaffold fournit une structure de base à l'écran.
      appBar: AppBar( // Barre d'application en haut de l'écran.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, // Définit la couleur de l'AppBar.
        title: Text(widget.title), // Définit le titre de l'AppBar avec la valeur transmise au widget.
      ),
      body: Center( // Centre les éléments à l'écran.
        child: Card(
          elevation: 8,
          margin: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/Dash+Dart+PNG++-+white.png"),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                        "Bienvenue $name",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                ),
                TextField(
                  onSubmitted: (newValue) {
                    setState(() {
                      name = newValue;
                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Nom du Flutteriste"),
                    hintText: "Entrez votre nom"
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
