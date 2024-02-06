part of'pages.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 60, width: 60, decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.blueAccent), child: Icon(MdiIcons.checkBold, size: 30, color: Colors.white,),),
          const   SizedBox(height: 30,),
           const  Text("Welcome to", style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w300, color: Colors.black),),
            const   Text("My Todo", style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold, color: Colors.black),),
              const   SizedBox(height: 8,),
            const      SizedBox(
                  width: 300,
                   child: const Text("My Toddo helps you stay organized and perform yout tasks faster", 
                   textAlign: TextAlign.center,
                   maxLines : 2,overflow: TextOverflow.visible,
                    style: TextStyle(fontSize: 14 , fontWeight: FontWeight.w400, color: Colors.grey),),
                 ),
                 const   SizedBox(height: 60,),

                    GestureDetector(
                      onTap: (){
                        Get.to(HomePage());
                      },
                      child: Container(height: 55, width: 160, decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: const Color(0xffD9E7FD)),
                      child:const Center(child: const Text("Mulai mencatat", style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w700, color: Colors.blue))),),
                    ),
                    const SizedBox(height: 30,),
                    // Text("No Thank", style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w800, color: Colors.blue))
          ],
        ),
      )),
    );
  }
}