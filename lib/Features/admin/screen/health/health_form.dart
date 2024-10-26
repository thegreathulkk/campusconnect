import 'package:campusconnect/Constants/Global_veriable.dart';
import 'package:campusconnect/common/widgets/custom_field.dart';
import 'package:flutter/material.dart';

class HealthCampFormPage extends StatefulWidget {
  @override
  State<HealthCampFormPage> createState() => _HealthCampFormPageState();
}

class _HealthCampFormPageState extends State<HealthCampFormPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Health Camp'),
        backgroundColor: GlobaleVeriables.selectedNavBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                  controller: nameController, hintText: 'Camp Name'),

              const SizedBox(height: 15),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Description',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black38,
                  )),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.black38,
                  )),
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Enter your date';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              CustomTextField(controller: dateController, hintText: 'Date'),
              const SizedBox(height: 15),
              CustomTextField(
                  controller: authorController, hintText: 'Host By'),
              const SizedBox(height: 15),
              CustomTextField(
                  controller: locationController, hintText: 'location'),
              const SizedBox(height: 20),
              //CustomBotton(text: 'Add Product', onTap: addProduct)
              ElevatedButton(
                onPressed: () {
                  //addEvent();
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

// Implement EventFormPage and HealthCampFormPage similarly to ProductFormPage
