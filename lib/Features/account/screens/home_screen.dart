import 'package:campusconnect/Constants/Global_veriable.dart';
import 'package:campusconnect/Features/account/widgets/cafe_menu.dart';
import 'package:campusconnect/Features/home/widget/top_categories.dart';
import 'package:campusconnect/models/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/user_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

void _onCardTap(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => CafeMenu(),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //String selectedLocation = 'GNDC';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: AppBar(
            backgroundColor: GlobaleVeriables.selectedNavBarColor,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Campus Connect',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 160.0),
                    Icon(Icons.location_pin),
                    SizedBox(width: 10.0),
                    Icon(Icons.notifications_outlined)
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Hello, ',
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: user.name,
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: SizedBox(
                height: 200,
                //color: Colors.amber,
                child: Image.asset(
                  'assets/images/food_fair.jpeg',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  Text(
                    'Food Categories',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 80,
              child: const TopCategories(),

              // child: ListView.builder(
              //   itemCount: GlobaleVeriables.categoryImages.length,
              //   scrollDirection: Axis.horizontal,
              //   itemExtent: 85,
              //   itemBuilder: (context, index) {
              //     return const TopCategories();
              // return GestureDetector(
              //   onTap: () => (
              //     //   context, navigateToCategoryPage
              //     //   GlobaleVeriables.categoryImages[index]['title']!,
              //   ),
              //   child: Column(
              //     children: [
              //       Container(
              //         padding: const EdgeInsets.symmetric(horizontal: 10),
              //         child: ClipRRect(
              //           borderRadius: BorderRadius.circular(50),
              //           child: Image.asset(
              //             GlobaleVeriables.categoryImages[index]['image']!,
              //             fit: BoxFit.cover,
              //             height: 50,
              //             width: 50,
              //           ),
              //         ),
              //       ),
              //       Text(
              //         GlobaleVeriables.categoryImages[index]['title']!,
              //         style: const TextStyle(
              //           fontSize: 12,
              //           fontWeight: FontWeight.w400,
              //         ),
              //       ),
              //     ],
              //   ),
              // );
              //   },
              // ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8, bottom: 8),
              child: Row(
                children: [
                  Text(
                    'Availble Food Vendors',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 240,
              child: ListView.builder(
                //itemCount: GlobaleVeriables.categoryImages.length,
                //scrollDirection: Axis.horizontal,
                //itemExtent: 100,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => (
                      // context,
                      // GlobaleVeriables.categoryImages[index]['title']!,
                    ),
                    child: Column(
                      children: [
                        ReusableCard(
                          imageUrl:
                              'https://1000logos.net/wp-content/uploads/2021/05/Wipro-logo-768x432.png',
                          title: 'Wipro Cafe',
                          rating: 4.5,
                          onTap: () {
                            _onCardTap(context);
                          },
                        ),
                        ReusableCard(
                            imageUrl:
                                'https://1000logos.net/wp-content/uploads/2021/05/Wipro-logo-768x432.png',
                            title: 'Wipro Cafe',
                            rating: 4.5),
                        ReusableCard(
                            imageUrl:
                                'https://1000logos.net/wp-content/uploads/2021/05/Wipro-logo-768x432.png',
                            title: 'Wipro Cafe',
                            rating: 4.5),
                        ReusableCard(
                            imageUrl:
                                'https://1000logos.net/wp-content/uploads/2021/05/Wipro-logo-768x432.png',
                            title: 'Wipro Cafe',
                            rating: 4.5),
                        ReusableCard(
                            imageUrl:
                                'https://1000logos.net/wp-content/uploads/2021/05/Wipro-logo-768x432.png',
                            title: 'Wipro Cafe',
                            rating: 4.5),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}

//food card

//     return ListView(
//       children: <Widget>[
//         FoodCard(foodName: 'Food Item 1'),
//         FoodCard(foodName: 'Food Item 2'),
//         FoodCard(foodName: 'Food Item 3'),
//         // Add more FoodCard widgets for other food items
//       ],
//     );
//   }
// }
