import 'package:campusconnect/Features/admin/screen/admin_screen.dart';
import 'package:campusconnect/Features/auth/screens/auth_screen.dart';
import 'package:campusconnect/provider/user_provider.dart';
import 'package:campusconnect/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Constants/Global_veriable.dart';
import 'Features/auth/services/auth_service.dart';
import 'common/widgets/bottom_bar.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context: context);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campus Connect',
      theme: ThemeData(
          scaffoldBackgroundColor: GlobaleVeriables.backgroundColor,
          colorScheme:
              const ColorScheme.light(primary: GlobaleVeriables.secondaryColor),
          appBarTheme: const AppBarTheme(
              elevation: 0, iconTheme: IconThemeData(color: Colors.black))),
      onGenerateRoute: ((settings) => generateRoute(settings)),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
              ? const BottomBar()
              : AdminPanel()
          : const AuthScreen(),
    );
  }
}
