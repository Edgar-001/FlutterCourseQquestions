import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:indigo/api/indigo_api.dart';
import 'package:indigo/models/product_model.dart';
import 'package:indigo/pages/shrine/shrine_page.dart';

import '../../base/routes.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); //

  bool isGrid = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            onPressed: () {
              isGrid = !isGrid;
              setState(() {});
              // _key.currentState!.openDrawer();
            },
            child: const Icon(Icons.menu),
          );
        },
      ),
      appBar: AppBar(
        title: const Text(
          'Home',
        ),

        // automaticallyImplyLeading: false,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.indigo,
              child: const DrawerHeader(
                child: Text(
                  'INDIGO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text('Home'),
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
            ListTile(
              title: const Text(
                'Feedback',
              ),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.feedback);
              },
            ),
            ListTile(
              title: const Text(
                'Shrine',
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ShrinePage()));
              },
            ),
            const Spacer(),
            ListTile(
              title: const Text('Log Out'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

//   Widget gridView(BuildContext context) {
//     return FutureBuilder(
//       future: IndigoAPI().products.getProductsData(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           final products = snapshot.data as List<ProductModel>;

//           return GridView(
//             padding: const EdgeInsets.all(10),
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 1,
//                 crossAxisSpacing: 5,
//                 mainAxisSpacing: 5),
//             children: [
//               ...products.map<Widget>((final product) {
//                 return productListItem(product);
//               }).toList(),
//             ],
//           );
//         } else {
//           return const Center(
//             child: Text('No Items'),
//           );
//         }
//       },
//     );
//   }
// }

// Widget listView(BuildContext context) {
//   return FutureBuilder(
//     future: IndigoAPI().products.getProductsData(),
//     builder: (context, snapshot) {
//       if (snapshot.hasData) {
//         final products = snapshot.data as List<ProductModel>;

//         return ListView(
//           padding: const EdgeInsets.all(10),
//           children: [
//             ...products.map<Widget>((final product) {
//               return productListItem(product);
//             }).toList(),
//           ],
//         );
//       } else {
//         return const Center(
//           child: Text('No Items'),
//         );
//       }
//     },
//   );
// }

// Widget productListItem(
//   ProductModel productModel,
// ) {
//   return Container(
//     decoration: BoxDecoration(
//       image: DecorationImage(
//         image: NetworkImage(productModel.imageUrl ?? ''),
//         fit: BoxFit.cover,
//       ),
//     ),
//     child: Text(
//       productModel.productName ?? '',
//       style: const TextStyle(color: Colors.amber),
//     ),
//   );
}
