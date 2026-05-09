import 'package:url_launcher/url_launcher.dart';

 Future lnch(String url) async{
   final content=Uri.parse(url);
   if(!await launchUrl(content,mode: LaunchMode.inAppWebView)){
     return "coul not launch browser";
   }
   else{
     return content.toString();
   }
 }
