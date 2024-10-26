import 'package:campusconnect/Constants/Global_veriable.dart';
import 'package:campusconnect/Features/home/services/home_services.dart';
import 'package:campusconnect/models/products.dart';
import 'package:flutter/material.dart';

class CategoryDealsScreen extends StatefulWidget {
  static const String routeName = '/category-deals';
  final String category;
  const CategoryDealsScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryDealsScreen> createState() => _CategoryDealsScreenState();
}

class _CategoryDealsScreenState extends State<CategoryDealsScreen> {
  List<Product>? productList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  fetchCategoryProducts() async {
    productList = await homeServices.fetchCategoryProducts(
      context: context,
      category: widget.category,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: GlobaleVeriables.selectedNavBarColor,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                //gradient: GlobaleVeriables.appBarGradient,
                ),
          ),
          title: Text(
            widget.category,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            alignment: Alignment.topLeft,
            child: Text(
              'Order Testy ${widget.category}',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 170,
            child: ListView.builder(
              itemCount: 10,
              //gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //crossAxisCount: 2),
              itemBuilder: (context, index) {
                final productData = productList![index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Card(
                    margin: const EdgeInsets.all(10.0),
                    child: ListTile(
                      title: Text('Name: ${productData.name}'),
                      subtitle: Text(
                          'Price: \₹${productData.price.toStringAsFixed(2)}'),
                      trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed:
                              () {} //() => deleteProduct(productData, index),
                          ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
