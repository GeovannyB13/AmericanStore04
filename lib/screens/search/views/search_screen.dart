import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _searchResults = [];

  void _onSearchChanged() {
    setState(() {
      // Aquí puedes agregar la lógica para actualizar los resultados de búsqueda
      _searchResults.clear();
      if (_searchController.text.isNotEmpty) {
        _searchResults.addAll([
          "Resultado 1",
          "Resultado 2",
          "Resultado 3",
        ]);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buscar"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Buscar productos...",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding / 2),
                  child: SvgPicture.asset(
                    "assets/icons/Search.svg",
                    height: 24,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultBorderRadious),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding),
            Expanded(
              child: _searchResults.isEmpty
                  ? Center(
                      child: Text(
                        "No se encontraron resultados",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    )
                  : ListView.builder(
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_searchResults[index]),
                          onTap: () {
                            // Aquí puedes agregar la lógica para manejar la selección de un resultado de búsqueda
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
