// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../core/res/assets.dart';

class ProfilePage extends StatelessWidget {

  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        title: const Text("View Profile"),
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: const [0.5, 0.9],
                    colors: [Colors.red, Colors.deepOrange.shade300])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CircleAvatar(
                      child: const Icon(
                        Icons.call,
                        size: 30.0,
                      ),
                      minRadius: 30.0,
                      backgroundColor: Colors.red.shade600,
                    ),
                    CircleAvatar(
                      minRadius: 60,
                      backgroundColor: Colors.deepOrange.shade300,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(images[0]),
                        minRadius: 50,
                      ),
                    ),
                    CircleAvatar(
                      child: const Icon(
                        Icons.message,
                        size: 30.0,
                      ),
                      minRadius: 30.0,
                      backgroundColor: Colors.red.shade600,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Chaudey",
                  style: TextStyle(fontSize: 22.0, color: Colors.white),
                ),
                Text(
                  "Kathmandu, Nepal",
                  style: TextStyle(fontSize: 14.0, color: Colors.red.shade700),
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.deepOrange.shade300,
                  child: const ListTile(
                    title: Text(
                      "50895",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0),
                    ),
                    subtitle: Text(
                      "FOLLOWERS",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.red,
                  child: const ListTile(
                    title: Text(
                      "34524",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0),
                    ),
                    subtitle: Text(
                      "FOLLOWING",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const ListTile(
            title: Text(
              "Email",
              style: TextStyle(color: Colors.deepOrange, fontSize: 12.0),
            ),
            subtitle: Text(
              "ram@kumar.com",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          const Divider(),
          const ListTile(
            title: Text(
              "Phone",
              style: TextStyle(color: Colors.deepOrange, fontSize: 12.0),
            ),
            subtitle: Text(
              "+977 9818225533",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          const Divider(),
          const ListTile(
            title: Text(
              "Twitter",
              style: TextStyle(color: Colors.deepOrange, fontSize: 12.0),
            ),
            subtitle: Text(
              "@ramkumar",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          const Divider(),
          const ListTile(
            title: Text(
              "Facebook",
              style: TextStyle(color: Colors.deepOrange, fontSize: 12.0),
            ),
            subtitle: Text(
              "facebook.com/ramkumar",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
