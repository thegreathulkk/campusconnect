import 'package:campusconnect/Constants/Global_veriable.dart';
import 'package:campusconnect/Features/admin/Services/admin_services.dart';
import 'package:campusconnect/Features/admin/Services/event/admin_event_service.dart';
import 'package:campusconnect/common/widgets/custom_button.dart';
import 'package:campusconnect/common/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventFormPage extends StatefulWidget {
  @override
  State<EventFormPage> createState() => _EventFormPageState();
}

class _EventFormPageState extends State<EventFormPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final EventServices eventServices = EventServices();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void addEvent() {
    if (_formKey.currentState!.validate()) {
      eventServices.addEvent(
        context: context,
        name: nameController.text,
        description: descriptionController.text,
        date: dateController.text,
        author: authorController.text,
        location: locationController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Event'),
        backgroundColor: GlobaleVeriables.selectedNavBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                  controller: nameController, hintText: 'Event Name'),

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
              CustomTextField(controller: authorController, hintText: 'Author'),
              const SizedBox(height: 15),
              CustomTextField(
                  controller: locationController, hintText: 'location'),
              const SizedBox(height: 20),
              //CustomBotton(text: 'Add Product', onTap: addProduct)
              ElevatedButton(
                onPressed: () {
                  addEvent();
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
