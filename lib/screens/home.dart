import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parcial3/widgets.dart'; // Importa los widgets PlacesCard y VisitedCard
import 'package:parcial3/services/data.dart'; // Asegúrate de importar tus datos

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    void onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: const [PlacesPage(), VisitsPage()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onItemTapped,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Lugares',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop),
            label: 'Visitados',
          ),
        ],
      ),
    );
  }
}

class PlacesPage extends ConsumerWidget {
  const PlacesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: [
              Text('Guatemala', style: Theme.of(context).textTheme.headline6),
              Text('Corazón del mundo maya',
                  style: Theme.of(context).textTheme.subtitle1),
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: places.length, // Utiliza la lista de lugares
              itemBuilder: (context, index) {
                final place = places[index];
                return PlacesCard(
                  image: place.image,
                  title: place.title,
                  description: place.description,
                  visited: place.visited,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class VisitsPage extends ConsumerWidget {
  const VisitsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Text('Lugares visitados',
              style: Theme.of(context).textTheme.headline6),
        ),
        const SizedBox(
          height: 30,
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Center(
              child: Text('Aqui va la lista con lugares ya visitados'),
            ),
          ),
        ),
      ],
    );
  }
}
