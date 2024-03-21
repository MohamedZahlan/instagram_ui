import 'package:flutter/material.dart';
import 'package:instagram_ui/constants/constants.dart';

class MessagesUI extends StatelessWidget {
  const MessagesUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "mohamed_zahlan",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          const Icon(Icons.video_call_outlined),
          SizedBox(
            width: width(context) / 20,
          ),
          const Icon(Icons.note_alt_outlined),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(
              elevation: const MaterialStatePropertyAll(0.0),
              backgroundColor: MaterialStatePropertyAll(Colors.grey.shade200),
              hintText: 'Search',
              leading: const Icon(Icons.search),
              padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(horizontal: width(context) / 15),
              ),
            ),
            SizedBox(
              height: height(context) / 20,
            ),
            Stack(
              children: [
                Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/Images/user0.png'),
                    ),
                    SizedBox(
                      height: height(context) / 50,
                    ),
                    const Text(
                      "Your note",
                      style: TextStyle(),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width(context) / 30,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Note...",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height(context) / 30,
            ),
            const Row(
              children: [
                Text(
                  "Messages",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  "Requests",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
