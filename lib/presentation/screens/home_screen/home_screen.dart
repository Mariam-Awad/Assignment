import 'package:assignment/presentation/screens/home_screen/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Provider.of<HomeScreenProvider>(context, listen: false).getStoredUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, homescreenprovider, child) {
        return WillPopScope(
          onWillPop: () async {
            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            return false;
          },
          child: Scaffold(body: Container()),
        );
      },
    );
  }
}
