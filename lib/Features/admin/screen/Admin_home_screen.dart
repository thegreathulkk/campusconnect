import 'package:campusconnect/Features/account/widgets/event_card.dart';
import 'package:campusconnect/Features/admin/Services/admin_services.dart';
import 'package:campusconnect/Features/admin/Services/event/admin_event_service.dart';
import 'package:campusconnect/models/event.dart';
import 'package:campusconnect/models/products.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/loader.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  List<Product>? products;
  List<Product>? events;
  final AdminServices adminServices = AdminServices();
  final EventServices eventServices = EventServices();

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  void fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
  }

  void fetchAllEvents() async {
    events = await eventServices.fetchAllEvetns(context);
  }

  void deleteProduct(Product product, int index) {
    adminServices.deleteProduct(
      context: context,
      product: product,
      onSuccess: () {
        products!.removeAt(index);
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Return the widget you want to display for the AdminHome state
    return products == null
        ? const Loader()
        : Scaffold(
            body: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "Food Menu",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                // Horizontal ListView for Product Actions
                Container(
                  height: 300, // Set the desired height
                  child: ListView.builder(
                    itemCount: products!.length,
                    //gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      final productData = products![index];
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
                              onPressed: () =>
                                  deleteProduct(productData, index),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Vertical ScrollView for Events and Health Camps
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Display Events
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 2),
                          child: Text(
                            "Events",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: 160,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(8),
                          //color: Colors.green, // Replace with your styling
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              // for (int i = 0; i < 5; i++)
                              //   EventWidget(Event(
                              //     name: 'Event $i',
                              //     location: 'Location $i',
                              //   )
                              // ),
                            ],
                          ),
                        ),
                        // Display Health Camps
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 2),
                          child: Text(
                            "Health Camps",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: 150,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(8),
                          //color: Colors.orange, // Replace with your styling
                          // child: Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Text(
                          //       'Health Camps',
                          //       style: TextStyle(fontWeight: FontWeight.bold),
                          //     ),
                          //     SizedBox(height: 8),
                          //     for (int i = 0; i < 5; i++)
                          //       HealthCampWidget(HealthCamp(
                          //         name: 'Health Camp $i',
                          //         date: 'Date $i',
                          //       )),
                          //   ],
                          // ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
