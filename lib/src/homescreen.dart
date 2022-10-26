import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:webview_flutter/webview_flutter.dart';
bool isLoading =true;
// ignore: must_be_immutable
class Homescreen extends StatefulWidget {
  static const id = "/homescreen";
    bool isLoading =true;
 

   Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  
  late WebViewController controller;
  @override
 
  void initState() {
     super.initState();
     
     if (Platform.isAndroid) WebView.platform = AndroidWebView();
   }





  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
             final value= await  showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Color(0xff600B0C),
              title: Text("Do you want to exit ??",style: GoogleFonts.inter(color: Colors.white,fontWeight: FontWeight.bold),),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text('NO',style: GoogleFonts.inter(color: Colors.white,fontWeight: FontWeight.w500))),
                TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text('YES',style: GoogleFonts.inter(color: Colors.white,fontWeight: FontWeight.w500))),
              ],
            ));
            if(value != null){
                  return Future.value(value);
            }else{
                return Future.value(false);
            } 
      },
      child: Scaffold(
        body: Stack(
          children: [
                WebView(onPageFinished: (finish){
                  setState(() {
                    isLoading =false;
                  });
                },

          javascriptMode: JavascriptMode.unrestricted,
           initialUrl: 'https://elitehubsa.com/',
           onWebViewCreated: (controller){
            this.controller = controller;
            
           },
               ),

          isLoading ? Center(child: SpinKitFadingCircle(
            size: 120,
            color: Color(
            
            0xff600B0C),),):Stack()
          ],
         
        ),
      ),
    );
  
  }


}
