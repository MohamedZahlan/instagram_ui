import 'package:flutter/material.dart';
import 'package:instagram_ui/constants/constants.dart';
import 'package:instagram_ui/models/post_model.dart';
import 'package:instagram_ui/models/story_model.dart';
import 'package:instagram_ui/views/home_ui/review_screen.dart';
import 'package:instagram_ui/views/messages_ui/messages_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  // to change fav icon
  dynamic iconFav = false;

  // this list to display story image
  List<StoryModel> story = [
    StoryModel('assets/Images/user1.png'),
    StoryModel('assets/Images/user2.png'),
    StoryModel('assets/Images/user3.png'),
    StoryModel('assets/Images/user4.png'),
    StoryModel('assets/Images/user0.png'),
  ];

  //this list to display Posts
  List<PostModel> post = [
    PostModel(
      'assets/Images/user0.png',
      'assets/Images/post0.jpg',
      'Sam Martin',
      '5 min',
      const Icon(
        Icons.more_horiz_sharp,
        size: 30,
      ),
      const Icon(
        Icons.favorite_border,
        size: 30,
      ),
      2.500,
      const Icon(
        Icons.comment,
        size: 30,
      ),
      '350',
      const Icon(
        Icons.bookmark_border_outlined,
        size: 30,
      ),
    ),
    PostModel(
      'assets/Images/user1.png',
      "assets/Images/post1.jpg",
      'Sam Martin',
      '10 min',
      const Icon(
        Icons.more_horiz_sharp,
        size: 30,
      ),
      const Icon(
        Icons.favorite_border,
        size: 30,
      ),
      1000,
      const Icon(
        Icons.comment,
        size: 30,
      ),
      '150',
      const Icon(
        Icons.bookmark_border_outlined,
        size: 30,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDF0F6),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.purple,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 30),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 30),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined, size: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.green,
            icon: Icon(Icons.movie_filter_outlined, size: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 30),
            label: '',
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Instagram",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Billabong',
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ReviewScreen(),
                        ));
                  },
                  icon: const Icon(
                    Icons.animation,
                    size: 29,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border,
                    size: 29,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {
                    navigateTo(context, const MessagesUI());
                  },
                  icon: const Icon(
                    Icons.send,
                    size: 29,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //this method to display story with a number i want
          SizedBox(
            height: 70,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => buildStoryItem(story[index]),
              separatorBuilder: (context, index) => const SizedBox(
                width: 2,
              ),
              itemCount: story.length,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 550,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildPostItem(post[index]),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: post.length,
            ),
          ),
        ],
      ),
    );
  }

// this method for Story UI
  Widget buildStoryItem(StoryModel model) => Container(
        height: 70,
        width: 70,
        margin: const EdgeInsets.only(left: 5),
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                const CircleAvatar(
                  radius: 32.5,
                  backgroundColor: Colors.purpleAccent,
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    model.image,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

// this method for build post UI
  Widget buildPostItem(PostModel model) => Container(
        height: 550,
        width: double.infinity,
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(
                    model.ProfileImage,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.Username,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      model.Date,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: model.icon0,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 380,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0, 5),
                    blurRadius: 8.0,
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(
                    model.PostImage,
                  ),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      iconFav = !iconFav;
                    });
                  },
                  icon: iconFav
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 30,
                        )
                      : model.icon1,
                ),
                Text(
                  model.likes.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 12,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.chat_outlined,
                    size: 30,
                  ),
                ),
                Text(
                  model.comments,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark_border_outlined,
                    size: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
