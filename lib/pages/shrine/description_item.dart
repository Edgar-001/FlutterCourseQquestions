import 'package:flutter/material.dart';

import 'package:indigo/models/product_model.dart';

class DescriptionItemWiget extends StatefulWidget {
  final ProductModel product;
  const DescriptionItemWiget({super.key, required this.product});

  @override
  State<DescriptionItemWiget> createState() => _DescriptionItemWigetState();
}

class _DescriptionItemWigetState extends State<DescriptionItemWiget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.productName ?? ''),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 10, 50, 100),
          child: Column(
            children: [
              Image(
                image: NetworkImage(widget.product.imageUrl ?? ''),
              ),
              Text(widget.product.description ?? ''
              ),
              const Padding(padding: EdgeInsetsDirectional.all(20)),
              Text(
                ' Prise \$${widget.product.price}.00',
                  style: TextStyle(fontWeight: FontWeight.w900),
              )
            ],
          ),
        ),
      ),
    );
  }
}
