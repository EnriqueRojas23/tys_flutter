import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tysmobile_flutter/toscanos_mobile_cupertino.dart';
import './screens/splash_screen.dart';
import './providers/orders.dart';
import './providers/auth.dart';
import './screens/auth_screen.dart';


const MaterialColor green = const MaterialColor(
  0xFF389940,
  const <int, Color>{
    50: const Color(0xFF389940),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => Auth()),
        ChangeNotifierProvider(builder: (context) => Orders()),
      ],
      child: Consumer<Auth>(
        
        builder: (ctx, auth, _) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'T-Track',
              theme: ThemeData(
                primarySwatch:  green,
                accentColor: green,
                fontFamily: 'Lato',
              ),
              home: auth.isAuth 
                  ?  FutureBuilder(
                      future: auth.into(),
                      builder: (ctx, authResultSnapshot) =>
                          authResultSnapshot.connectionState ==
                                  ConnectionState.waiting
                              ? SplashScreen()
                              : ToscanosMobileCupertino(),
                    )
                  : FutureBuilder(
                      future: auth.tryAutoLogin(),
                      builder: (ctx, authResultSnapshot) =>
                          authResultSnapshot.connectionState ==
                                  ConnectionState.waiting
                              ? SplashScreen()
                              : AuthCard(),
                    ),
               routes: {
              //   HomeManifiesto.routeName: (ctx) => ProductDetailScreen(),
              //   CartScreen.routeName: (ctx) => CartScreen(),
              //   OrdersScreen.routeName: (ctx) => OrdersScreen(),
              //   UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
              //   EditProductScreen.routeName: (ctx) => EditProductScreen(),
              },
            ),
      ),
    );
  }
  
}
