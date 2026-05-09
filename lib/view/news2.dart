import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:relosnews/Services/api_service.dart';
import 'package:relosnews/Model/apiclass.dart';
import 'package:relosnews/view/detailscreen.dart';
import 'package:relosnews/viewmodel/url_launcher.dart';
import 'package:toastification/toastification.dart';


Future<api_service> fetchData() async {
  return await api_service_Services().fetchdata();
}

class Newsscreen22 extends ConsumerStatefulWidget {
  const Newsscreen22({super.key});

  @override
  ConsumerState<Newsscreen22> createState() => _Newsscreen22State();
}

class _Newsscreen22State extends ConsumerState<Newsscreen22> {
  late Future news;
  @override
  void initState() {
    super.initState();
    news=fetchData();
  }
  Widget build(BuildContext context) {
    print("screen called");
    return Scaffold(
      body: FutureBuilder(
        future: news,
        builder: (context, snapshot) {
          if (!snapshot.hasData ||
              snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final data = snapshot.data!;
            var index = 0;
            final article = data.articles!;
            return FlipCard(
              front: Container(
                padding: EdgeInsetsGeometry.all(15),
                child: Stack(
                  children: [
                    // 1. Background Image (Poori screen par)
                    Positioned.fill(
                      child: Image.network(
                        "${article[index].urlToImage}",
                        fit: BoxFit.cover, // Poora space fill karegi bina khinche
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(
                              child: Icon(Icons.broken_image, size: 50),
                            ),
                      ),
                    ),
                    Positioned(
                      bottom: 60, // Bottom se thoda upar
                      left: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () {
                          print("Explore Clicked");
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              article[index].title ?? "No Title",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextButton(
                              onPressed: () {
                                lnch(article[index].url.toString());
                              },
                              child: const Text(
                                "EXPLORE NOW",
                                style: TextStyle(
                                  color: Colors.white70,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                      Positioned.fill(child: Column(
                        mainAxisAlignment: MainAxisAlignment.start
                        ,
                        children: [
                        Padding(
                        padding: EdgeInsetsGeometry.all(10),
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        InkWell(
                        onTap: () => detail(article: article, index: index-1)
                        ,child: CircleAvatar(
                        radius: 35,
                        child:Icon(Icons.arrow_circle_left_rounded),
                        ),
                        ),
                        InkWell(
                        onTap: () {
                        if (index >= (article.length) - 1) {
                        toastification.show(
                        context: context,
                        type: ToastificationType.warning,
                        style: ToastificationStyle.flat,
                        autoCloseDuration: const Duration(seconds: 3),
                        title: const Text('News session ended for today'),
                        );
                        }
                        else {
                        Get.to(
                        ()=>detail(article: article, index: index+1), transition: Transition.rightToLeftWithFade,
                        preventDuplicates: false
                        );
                        }
                        },
                        child: CircleAvatar(
                        radius: 35,
                        child:Icon(Icons.arrow_circle_right_rounded),
                        ),
                        )
                        ],
                        ),
                        )
                        ],
                        )
                      )
                  ],
                ),
              ), back: Center(child: Text("hello"),),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("error ${snapshot.error}"));
          } else {
            return Center(child: Text("diff error"));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text("AI"),
      ),
    );
  }
}
