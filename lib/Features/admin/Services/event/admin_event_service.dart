import 'dart:convert';
import 'package:campusconnect/Constants/Global_veriable.dart';
import 'package:campusconnect/Constants/error_handling.dart';
import 'package:campusconnect/Constants/util.dart';
import 'package:campusconnect/models/event.dart';
import 'package:campusconnect/models/products.dart';
import 'package:campusconnect/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class EventServices {
  void addEvent({
    required BuildContext context,
    required String name,
    required String description,
    required String date,
    required String author,
    required String location,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      Event event = Event(
          name: name,
          description: description,
          location: location,
          date: date,
          author: author);
      http.Response res = await http.post(
        Uri.parse('$uri/admin/add-event'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: event.toJson(),
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnakBar(context, 'Event added');
            Navigator.pop(context);
          });
    } catch (e) {
      showSnakBar(context, e.toString());
    }
  }

  Future<List<Product>> fetchAllEvetns(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/admin/get-event'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            productList.add(
              Product.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnakBar(context, e.toString());
    }
    return productList;
  }

  void deleteProduct({
    required BuildContext context,
    required Product product,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/delete-event'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          onSuccess();
        },
      );
    } catch (e) {
      showSnakBar(context, e.toString());
    }
  }
}
