import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/product_viewmodel.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<ProductViewModel>(context, listen: false).fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ProductViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Produk')),
      body: vm.isLoading
          ? const Center(child: CircularProgressIndicator())
          : vm.errorMessage.isNotEmpty
              ? Center(child: Text(vm.errorMessage))
              : ListView.builder(
                  itemCount: vm.products.length,
                  itemBuilder: (context, index) {
                    final product = vm.products[index];
                    return Card(
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(product.title),
                        subtitle: Text('Rp ${product.price}'),
                      ),
                    );
                  },
                ),
    );
  }
}
