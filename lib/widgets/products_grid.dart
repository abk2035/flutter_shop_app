import 'package:flutter/material.dart';
import 'package:shop/widgets/product_item.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {
  final bool showOnlyFavorite;

  const ProductsGrid({super.key, required this.showOnlyFavorite});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =
        showOnlyFavorite ? productsData.favoriteItems : productsData.items;

    return GridView.builder(
      itemCount: products.length,
      padding: const EdgeInsets.all(10.0),
      itemBuilder: (context, index) => ChangeNotifierProvider<Product>.value(
        value: products[index],
        child: ProductItem(
            // id: products[index].id,
            // title: products[index].title,
            // imageUrl: products[index].imageUrl
            ),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10),
    );
  }
}
