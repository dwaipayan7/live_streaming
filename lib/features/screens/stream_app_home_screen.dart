import 'package:flutter/material.dart';
import 'package:live_streaming/cors/color/colors.dart';
import 'package:live_streaming/features/models/model.dart';

class StreamAppHomeScreen extends StatefulWidget {
  const StreamAppHomeScreen({super.key});

  @override
  State<StreamAppHomeScreen> createState() => _StreamAppHomeScreenState();
}

class _StreamAppHomeScreenState extends State<StreamAppHomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                SizedBox(
                  height: size.height * 0.16,

                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: streamItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: Stack(
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
                                      width: streamItems[index].isLiveNow
                                          ? 3
                                          : 1,
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
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
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
