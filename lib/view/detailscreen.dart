import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:relosnews/Features/gradientcolour.dart';
import 'package:relosnews/Features/toast.dart';
import 'package:relosnews/main.dart';
import 'package:relosnews/view/news2.dart';
import 'package:relosnews/view/subscreen.dart';
import 'package:relosnews/viewmodel/hive.dart';
import 'package:relosnews/viewmodel/url_launcher.dart';
import 'package:toastification/toastification.dart';

class detail extends StatelessWidget {
  List article;
  int index;
  int pg;
  detail({super.key, required this.article, required this.index,required this.pg});

  @override
  Widget build(BuildContext context) {
    var v = article.length;
    print("$index");
    print("length is $v\n");
    if(index==v){
      index=0;
      hive().setidx(index);
     Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftWithFade,child:Newsscreen22(idx: 0, pg: 1)));
    }
    hive().setidx(index);
    print("detail called");
    return Scaffold(
      backgroundColor: Colors.black87,
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! < 0) {
            Navigator.pushReplacement(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeftWithFade,
                child: detail(article: article, index: index + 1, pg: pg,),
              ),
            );
          }
          if (details.primaryVelocity! > 0) {
            if (index == 0) {
              return tst(
                context,
                "this is the first screen",
                ToastificationType.error,
              );
            } else {
              Navigator.pushReplacement(
                context,
                PageTransition(
                  type: PageTransitionType.leftToRightWithFade,
                  child: detail(article: article, index: index - 1, pg: pg,),
                ),
              );
            }
          }
        },
        child: Container(
          padding: EdgeInsetsGeometry.all(15),
          child: Stack(
            children: [
              Container(
                alignment: AlignmentGeometry.center,
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: getcolor())
                ),
          ),
                Positioned(
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(
                      15
                    ),
                    child: Align(
                      alignment: AlignmentGeometry.topStart,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.58,
                          child: Image.network(
                            alignment: AlignmentGeometry.topCenter,
                            "${article[index].urlToImage}",
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Center(
                                  child: Icon(Icons.broken_image, size: 50),
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              Positioned(
                bottom: 60,
                left: 0,
                right: 0,
                child: InkWell(
                  onTap: () {
                    lnch(article[index].url);
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
                          "   🖐️🖐️\n  Tap here to \n EXPLORE",
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
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "Ai screen",
        onPressed: () {
          Navigator.push(context,PageTransition(type:PageTransitionType.bottomToTop ,child: PremiumPaywallScreen(text: "${article[index].url}")));
        },
        child: Text("AI"),
      ),
    );
  }
}
