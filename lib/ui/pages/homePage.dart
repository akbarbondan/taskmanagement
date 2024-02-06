part of'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ConsumeApi api = ConsumeApi();
  List taskrecord = [];

  getRecord() async{
    taskrecord = await api.getRecord();
    setState(() {
      
    });
 
  }
  @override
  void initState() {
    // TODO: implement initState
      getRecord();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      getRecord();
    });
    return Scaffold(
      backgroundColor: const Color(0xffF3F3F3),
      appBar: AppBar(leading : GestureDetector(
        child: Icon(MdiIcons.menu, size: 32, color: Colors.black,)), 
      backgroundColor: const Color(0xffF3F3F3), elevation: 0, 
      title: const Text("My Todo", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      actions: [Container(margin: const EdgeInsets.only(right: 16), child: Icon(MdiIcons.bell, color: Colors.black,))],
      ),
      body: SafeArea(
        
        child:  Container(margin: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount : taskrecord.length,
          itemBuilder: (contex, index){
            return CardTask(title: taskrecord[index]["title"], deskripsi: taskrecord[index]["description"], onTap: (){
              Get.to(CreateTaskPage(id: taskrecord[index]["uid"], title: taskrecord[index]["title"], deskripsi: taskrecord[index]["description"],),);
            },);
          },
        //   children:  [
        //   Row(children: const [Text("Remaining Tasks", style: TextStyle(fontSize: 16)), Text("(3)", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))],),
        //  const SizedBox(height: 16,),
        //   const CardTask(),
        //   const CardTask(),
        //   const ,
        // ]
          ) ,
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.to(const CreateTaskPage());
      }, child: Icon(MdiIcons.plus, size: 40), shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),),
    );
  }
}