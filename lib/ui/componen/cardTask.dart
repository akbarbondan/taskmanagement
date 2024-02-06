part of 'componens.dart';

class CardTask extends StatelessWidget {
  final String title;
  final String deskripsi;
  final Function()? onTap;
   const CardTask({this.title = "No title", this.deskripsi="blank", @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
        color: const  Color.fromARGB(255, 255, 255, 255)
        )
        ,padding: const EdgeInsets.fromLTRB(12,18,12,18),
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [ Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: const Color(0xff2967D0)),
              child: Center(child: Icon(MdiIcons.check, color: const Color(0xfffffffff),)),
              margin: const EdgeInsets.only(right: 12),
            ),
    
             SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Title(color: Colors.black, child:  Text(title, maxLines: 1, overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
             const SizedBox(height: 8,),
              Title(color: Colors.black, child:  Text(deskripsi, maxLines: 1, overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 16),)),],
              )
              
            ),],),
            
            const Text("May 16", style: TextStyle(color: Colors.grey),)
          ],
        ),
      ),
    );
  }
}