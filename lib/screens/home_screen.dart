import 'package:flutter/material.dart';
import 'package:fluttern/constants/constants.dart';
import 'package:fluttern/screens/member_screen.dart';
import 'package:fluttern/screens/post_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          title:  Text(
            'Fluttern',
            style: kTitleText.copyWith(color: kAccentColor, fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            tabs: [
              Tab(icon: Text('Jobs/Internships', style: kLightTitleText,)),
              Tab(icon: Text('Members', style: kLightTitleText,)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PostScreen(),
            MemberScreen(),
          ],
        ),
      ),
    );
  }
}
