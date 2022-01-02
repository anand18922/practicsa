import 'package:contactus/contactus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Contactus_screen()));
}

class Contactus_screen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: ContactUs(
          logo:const AssetImage('assets\images\profil.jpg'),
          email: 'officialanandsinha101@gmail.com',
          companyName: 'Anand',
          phoneNumber: '7644004226',
          dividerThickness: 2,
          website: 'https://abhishekdoshi.godaddysites.com',
          githubUserName: 'anand18922',
          linkedinURL: 'https://www.linkedin.com/in/abhishek-doshi-520983199/',
          tagLine: 'Flutter Developer',
          instagram: 'vibewithboss',
          twitterHandle: 'AbhishekDoshi26', textColor: Colors.white, taglineColor:Colors.white, cardColor: Colors.teal, companyColor: Colors.white,

        ),

        bottomNavigationBar: ContactUsBottomAppBar(
          companyName: 'Anand',
          textColor: Colors.white,
          backgroundColor: Colors.teal.shade300,
          email: 'officialanandsinha101@gmail.com',
        ),
      ),

    );
  }
}
