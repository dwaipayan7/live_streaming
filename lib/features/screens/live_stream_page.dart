import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:live_streaming/features/models/model.dart';

class LiveStreamPage extends StatelessWidget {
  final StreamItems streamItems;
  const LiveStreamPage({super.key, required this.streamItems});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Hero(
          tag: streamItems.image,
          child: Image.network(
            streamItems.image,
            fit: BoxFit.fitHeight,
            height: size.height,
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 50),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(streamItems.url),
                  ),
                ),
                SizedBox(width: 8),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      streamItems.name,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      "${streamItems.followers} Followers",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(width: 15),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blueAccent,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          margin: const EdgeInsets.all(8).copyWith(left: 0),
                          child: Text(
                            "Follow",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              decoration: TextDecoration.none,
                              fontSize: 16,
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 100, sigmaY: 1),
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 7,
                                vertical: 10,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.visibility_outlined,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    streamItems.viewer,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
