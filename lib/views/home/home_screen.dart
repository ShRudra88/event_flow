import 'package:event_flow/controller/creat_event_controller.dart';
import 'package:event_flow/views/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeScreen extends StatefulWidget
{
  final bool showLoginButton;
  HomeScreen({super.key, this.showLoginButton = false});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeScreen();
  }

}

class _HomeScreen extends State<HomeScreen> {
   // New parameter to determine whether to show the login button
  final AddEventController controller = Get.find<AddEventController>();

  List<String> title=[];
  List<String> location=[];

  //HomeScreen({super.key, this.showLoginButton = false});


  // Default to false if not provided

  Future<void> getinfo()async{
  DatabaseReference ref=await FirebaseDatabase.instance.ref("user");
  var user=await FirebaseAuth.instance.currentUser;
  String user_name=(user!.email!).split("@").first;

  String x=(await ref.child("$user_name/title").get()).value.toString();
  String y=(await ref.child("$user_name/location").get()).value.toString();
  String z=(await ref.child("$user_name/is_verified").get()).value.toString();
  if(z=="YES" || z=="Yes" || z=="yes")
    {
      setState(()
      {
        title.add(x);
        location.add(y);
      });
    }
  else
    {
      setState(() {
        title.clear();
        location.clear();
      });
    }
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getinfo();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Homepage'),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color(0xff2d9510),
                Color(0xff65c34b),
                Color(0xff5900ad),
              ],
              radius: 1.2,
              center: Alignment(0.0, 0.0),
              focal: Alignment(0.0, 0.0),
              focalRadius: 0.2,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                "What's Happening Today",
                style: TextStyle(
                  fontSize: size.width * 0.07,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                    child:ListView.builder(
                      itemCount: title.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white.withOpacity(0.85),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15,
                            ),
                            title: Text(
                              title[index],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              location[index],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward,
                              color: Color(0xFF6a4bc3),
                            ),
                            onTap: () {
                              // Handle event tap
                            },
                          ),
                        );
                      }
                      )
                    )
              ),
              const Spacer(),
              if (widget.showLoginButton) // Conditionally show the login button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => LoginPage());  // Navigate to LoginPage
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: const Color(0xFF004aad),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
