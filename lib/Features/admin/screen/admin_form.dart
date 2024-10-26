import 'package:campusconnect/Constants/Global_veriable.dart';
import 'package:campusconnect/Features/admin/Services/admin_services.dart';
import 'package:campusconnect/common/widgets/custom_button.dart';
import 'package:campusconnect/common/widgets/custom_field.dart';
import 'package:flutter/material.dart';

class ProductFormPage extends StatefulWidget {
  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  //final TextEditingController vendorController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final AdminServices adminServices = AdminServices();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void addProduct() {
    if (_formKey.currentState!.validate()) {
      double price;
      String priceText =
          priceController.text.trim(); // Remove leading/trailing whitespaces

      if (priceText.isNotEmpty) {
        try {
          price = double.parse(priceText);
          // Ensure that price is a non-negative value
          if (price < 0) {
            print('Price cannot be negative');
            // You may want to show an error message to the user
            return;
          }
        } catch (e) {
          // Handle the case where parsing fails (e.g., show an error message)
          print('Error parsing price: $e');
          // You may want to show an error message to the user
          return;
        }
      } else {
        // Handle the case where the price field is empty (e.g., show an error message)
        print('Price is empty');
        // You may want to show an error message to the user
        return;
      }

      adminServices.addProduct(
        context: context,
        name: nameController.text,
        description: descriptionController.text,
        price: price,
        category: categoryController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        backgroundColor: GlobaleVeriables.selectedNavBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(controller: nameController, hintText: 'name'),
              const SizedBox(height: 15),
              CustomTextField(
                  controller: descriptionController, hintText: 'description'),
              const SizedBox(height: 15),
              CustomTextField(controller: priceController, hintText: 'price'),
              const SizedBox(height: 15),
              //CustomTextField(controller: vendorController, hintText: 'vendor'),
              CustomTextField(
                  controller: categoryController, hintText: 'category'),
              const SizedBox(height: 20),
              //CustomBotton(text: 'Add Product', onTap: addProduct)
              ElevatedButton(
                onPressed: () {
                  addProduct();
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class EventFormPage extends StatelessWidget {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product Form'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Field 1'),
//                 // Add more TextFormField widgets for other fields
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     // Process form data
//                     // Redirect to previous page
//                     Navigator.pop(context);
//                   }
//                 },
//                 child: Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

