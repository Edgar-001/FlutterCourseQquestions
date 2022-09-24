
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:indigo/pages/shrine/description_item.dart';

import '../../api/indigo_api.dart';
import '../../models/product_model.dart';

class ShrinePage extends StatefulWidget {
  const ShrinePage({super.key});

  @override
  State<ShrinePage> createState() => _ShrinePageState();
}

class _ShrinePageState extends State<ShrinePage> {
  bool isGrid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SHRINE'),
        actions: [
          IconButton(
              onPressed: () {
                isGrid = !isGrid;
                setState(() {});
                // _key.currentState!.openDrawer();
              },
              icon: !isGrid
                  ? const Icon(Icons.drag_indicator_outlined)
                  : const Icon(Icons.list))
        ],
      ),
      body: isGrid ? gridView(context) : listView(context),
    );
  }
}

Widget gridView(BuildContext context) {
  return FutureBuilder(
    future: IndigoAPI().products.getProductsData(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final products = snapshot.data as List<ProductModel>;

        return GridView(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5),
          children: [
            ...products.map<Widget>((final product) {
              return productGridItem(product, context);
            }).toList(),
          ],
        );
      } else {
        return const Center(
          child: Text('No Items'),
        );
      }
    },
  );
}

Widget listView(BuildContext context) {
  return FutureBuilder(
    future: IndigoAPI().products.getProductsData(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final products = snapshot.data as List<ProductModel>;

        return ListView(
          children: [
            ...products.map<Widget>((
              final product,
            ) {
              return productListItem(product, context);
            }).toList(),
          ],
        );
      } else {
        return const Center(
          child: Text('No Items'),
        );
      }
    },
  );
}

Widget productGridItem(ProductModel productModel, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DescriptionItemWiget(
            product: productModel,
          ),
        ),
      );
    },
    child: Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 15.0, // soften the shadow
            spreadRadius: 5.0, //extend the shadow
            offset: Offset(
              5.0, // Move to right 5  horizontally
              5.0, // Move to bottom 5 Vertically
            ),
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(productModel.imageUrl ?? ''),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Text(
            productModel.productName ?? '',
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            '\$${productModel.price}.00',
            style: const TextStyle(fontWeight: FontWeight.w900),
          )
        ],
      ),
    ),
  );
}

Widget productListItem(ProductModel productModel, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DescriptionItemWiget(
            product: productModel,
          ),
        ),
      );
    },
    child: Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 15.0, // soften the shadow
            spreadRadius: 5.0, //extend the shadow
            offset: Offset(
              5.0, // Move to right 5  horizontally
              5.0, // Move to bottom 5 Vertically
            ),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(productModel.imageUrl ?? ''),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productModel.productName ?? '',
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                '\$${productModel.price}.00',
                style: const TextStyle(fontWeight: FontWeight.w900),
              ),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 20,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                // ignore: prefer_const_constructors
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
            ],
          )
        ],
      ),
    ),
  );
}
