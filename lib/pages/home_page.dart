import 'package:flutter/material.dart';
import 'package:kuis/data/data.dart';
import 'package:kuis/pages/detail_page.dart';
import 'package:kuis/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  final String username;
  final String displayName;

  const HomePage({
    super.key,
    required this.username,
    required this.displayName,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Selamat datang, ${widget.displayName}'),
      ),

      body: IndexedStack(
        index: selectedIndex,
        children: [
          // ==================== HOME ====================
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      const Text(
                        'Uniqlo',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: catalog.length,
                  itemBuilder: (context, index) {
                    final product = catalog[index];

                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(10),

                        // Klik menu → Detail
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(product: product),
                            ),
                          );
                        },

                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            product.imageUrl,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),

                        title: Text(
                          product.productName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),

                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product.type),
                              const SizedBox(height: 4),
                              Text(
                                product.price,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.favorite,
                                color: Colors.pink,
                                size: 24.0,
                                semanticLabel:
                                    'Text to be read by screen readers',
                              ),
                              Text(
                                '${product.likeCount}like',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Stok=${product.stock}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          // ==================== PROFILE ====================
          ProfilePage(username: widget.username),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
