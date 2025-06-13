import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:live_streaming/cors/color/colors.dart';
import 'package:live_streaming/features/models/model.dart';
import 'package:live_streaming/features/models/stream_category.dart';

import 'live_stream_page.dart';

class StreamAppHomeScreen extends StatefulWidget {
  const StreamAppHomeScreen({super.key});

  @override
  State<StreamAppHomeScreen> createState() => _StreamAppHomeScreenState();
}

class _StreamAppHomeScreenState extends State<StreamAppHomeScreen> {
  late Size size = MediaQuery.of(context).size;
  String category = "🎮Gaming";
  List<StreamItems> stream = streamItems;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stream = streamItems
        .where(
          (element) => element.category.toLowerCase() == category.toLowerCase(),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              children: [
                headerPart(),
                SizedBox(height: 30),

                //live creator and remaining all
                profile(context),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),

                      Text(
                        'View All',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                SizedBox(
                  height: size.height * 0.05,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: streamCategory.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            category = streamCategory[index].title;
                            category == ""
                                ? stream = streamItems
                                : stream = streamItems
                                      .where(
                                        (element) =>
                                            element.category.toLowerCase() ==
                                            category.toLowerCase(),
                                      )
                                      .toList();
                          });
                        },

                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          margin: EdgeInsets.only(left: 12),
                          decoration: BoxDecoration(
                            color: category == streamCategory[index].title
                                ? Colors.purpleAccent
                                : Colors.grey.shade700,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                streamCategory[index].title,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 30),

                //category items
                SizedBox(
                  height: size.height * 0.55,
                  width: double.infinity,

                  child: GridView.builder(
                    itemCount: stream.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      final streamItems = stream[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  LiveStreamPage(streamItems: streamItems),
                            ),
                          );
                        },
                        child: SizedBox(
                          child: SingleChildScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Hero(
                                        tag: streamItems.image,
                                        child: Image.network(
                                          streamItems.image,
                                          width: size.width * 0.47,
                                          height: size.height * 0.25,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      top: 7,
                                      left: 7,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 10,
                                            sigmaY: 10,
                                          ),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 7,
                                              vertical: 4,
                                            ),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.visibility_outlined,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(width: 3),
                                                Text(
                                                  streamItems.viewer,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      top: 7,
                                      right: 7,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 7,
                                          vertical: 2.5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: Text(
                                          "Live",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      bottom: 7,
                                      left: 15,
                                      child: Text(
                                        streamItems.streamTitle,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),

                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 7,
                                          ),
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                              streamItems.url,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            streamItems.name,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          Text(
                                            "${streamItems.followers} Followers",
                                            style: TextStyle(
                                              color: Colors.white60,
                                            ),
                                          ),
                                        ],
                                      ),

                                      Spacer(),
                                      Icon(
                                        Icons.more_vert,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 70,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Icon(
                                Iconsax.home5,
                                color: Colors.white,
                                size: 30,
                              ),

                              Positioned(
                                bottom: -15,
                                right: 0,
                                left: 0,
                                child: CircleAvatar(radius: 3),
                              ),
                            ],
                          ),

                          Icon(Iconsax.chart, color: Colors.white60, size: 30),
                          SizedBox(width: 15),
                          Icon(
                            Iconsax.message,
                            color: Colors.white60,
                            size: 30,
                          ),
                          // SizedBox(width: 15),
                          Icon(
                            Icons.person_2_outlined,
                            color: Colors.white60,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.purpleAccent,
        shape: CircleBorder(),
        child: Icon(Icons.add, size: 30, color: Colors.white),
      ),
    );
  }

  Widget profile(BuildContext context) {
    return SizedBox(
      height: size.height * 0.16,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: streamItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: streamItems[index].isLiveNow
                              ? Colors.red
                              : Colors.white38,
                          width: streamItems[index].isLiveNow ? 3 : 1,
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: streamItems[index].color,
                        ),
                        child: Image.network(
                          streamItems[index].url,
                          fit: BoxFit.cover,
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),

                    SizedBox(height: 8),
                    Text(
                      streamItems[index].name,
                      style: TextStyle(
                        color: streamItems[index].isLiveNow
                            ? Colors.white
                            : Colors.white54,
                      ),
                    ),
                  ],
                ),

                //Live or not
                streamItems[index].isLiveNow
                    ? Positioned(
                        left: 28,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(width: 3),
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "Live",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget headerPart() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "GoLive",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 28,
              ),
            ),
          ),

          iconButton(Icons.nightlight_outlined),
          SizedBox(width: 15),
          iconButton(Icons.notifications_outlined),
          SizedBox(width: 15),
          iconButton(Icons.search),
        ],
      ),
    );
  }

  Widget iconButton(IconData icon) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: kSecondarybgColor,
      child: Icon(icon, size: 30, color: Colors.white),
    );
  }
}
