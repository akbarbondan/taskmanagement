part of 'pages.dart';

class CreateTaskPage extends StatefulWidget {
  final String? id;
  final String? title;
  final String? deskripsi;
  const CreateTaskPage({@required this.id, @required this.title, @required this.deskripsi });
  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  ConsumeApi api = ConsumeApi();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

@override
  void initState() {
    if(widget.id != null){
      title.text = widget.title.toString();
      description.text = widget.deskripsi.toString();
    }else{
      title.text = "";
      description.text = "";
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
        GestureDetector(
          onTap: (){       
           if(widget.id != null){

            api.updateRecord(widget.id!, title.text, description.text);
             setState(() {
                
              });
              Get.back();
              Get.snackbar("Berhasil Mengedit data", "");

           }else{
              if(title.text != "" && description.text !=""){
             api.insertRecord(title.text, description.text);
             
              setState(() {
                
              });
             
              Get.back();
               Get.snackbar("Berhasil menyimpan data", "");
            
            }else{
              Get.snackbar("Pemberitahuan", "Silahkan lengkapi field");
            }
           }

           
            
          },
          child: const Padding(padding: EdgeInsets.only(right: 16), child: Text("Simpan", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 14),),)),

// Delete method
         (widget.id != null) ?   GestureDetector(
          onTap: (){
              api.deletedRecord(widget.id.toString());
              Get.back();
              Get.snackbar("Berhasil Menghapus data", "");
          },
          child: const Padding(padding: EdgeInsets.only(right: 16), child: Text("Hapus", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 14),),)) : const SizedBox()   
          ],),
      
      
      body: SafeArea(child: Column(
        children:  [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20,16,0),
            child: TextField(
              controller: title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              decoration: const InputDecoration(
                hintText: "Enter your title", hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey)),
            ),
          ),
         Padding(padding: const  EdgeInsets.all(16), child: TextField(
              maxLines: 30,
              controller:  description,
              decoration: const  InputDecoration.collapsed(hintText: "Enter yout text here", )),),
        ],
      )),
    );
  }
}