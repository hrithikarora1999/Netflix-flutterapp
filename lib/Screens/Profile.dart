
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviebiz/Helper/HelperClasses.dart';
import 'package:moviebiz/Helper/HelperFunctions.dart';

import 'HomeScreen.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: AssetImage('images/netflix_logo1.png'),width: 100,height: 40,),
            SizedBox(height: 10,),
            Text('Who is Watching?',style: TextStyle(color: Colors.white,fontSize: 18),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

                },
                child: Column(
                children: [
                  Container(
                    height: 150,
                    width: 120,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'images/witcher.jpg'
                            ),
                          fit: BoxFit.cover
                        )
                    ),
                  ),
            const SizedBox(height: 8.0,),
            Text('Hrithik',style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)
          ],
        ),
              ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

                  },
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: 120,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'images/crown.jpg'
                                ),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                      const SizedBox(height: 8.0,),
                      Text('Personal',style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

                  },
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: 120,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'images/explained.jpg'
                                ),
                                fit: BoxFit.cover

                            )
                        ),
                      ),
                      const SizedBox(height: 8.0,),
                      Text('Dhruv',style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

                  },
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: 120,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'images/tiger_king.jpg'
                                ),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                      const SizedBox(height: 8.0,),
                      Text('Lucifer',style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 75,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BannerButton(icon: Icons.add_circle_outline,title: 'Add Profile',),
                ],
              ),
            ),

          ],
        ),

      ),
    );
  }
}
