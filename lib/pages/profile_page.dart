import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store/widgets/other_widgets/custom_app_bar.dart';
import 'package:store/widgets/profile_widgets/custom_general_data.dart';
import 'package:store/widgets/other_widgets/cutom_text.dart';
import 'package:store/widgets/profile_widgets/custom_user_data.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Smart Shopping'),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              if (auth.currentUser == null)
                const Padding(
                  padding: EdgeInsets.only(top: 4, bottom: 16),
                  child: CustomText(
                    title: 'Try to log in in for better options',
                    fontSize: 20,
                    textAlign: TextAlign.center,
                  ),
                ),
              if (auth.currentUser != null) const CustomUserData(),
              const CustomGeneralData(),
            ],
          ),
        ),
      ),
    );
  }
}
