import 'package:flutter/material.dart';
import 'package:kuis_f/model/clothes_model.dart';

class DetailPage extends StatefulWidget {
  final ClothesModel clothes;

  const DetailPage({super.key, required this.clothes});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // actions: [TextButton(onPressed: () {}, child: Icon(Icons.menu))],
          title: Text(widget.clothes.name),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(children: [
            _detailContainer(context),
           // _sizelist(context)
          ]),
        ),
      ),
    );

    
  }

  // Widget _sizelist(BuildContext context){
  //   return Expanded(
  //     child: GridView.builder(
  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: count,
  //         crossAxisSpacing: 12,
  //         mainAxisSpacing: 12,
  //       ),
  //       itemBuilder: (context, index) => widget.clothes.sizes(context, index),
  //       itemCount: tourismPlaceList.length,
  //     ),
  //   );
  // }

  
    // double width = MediaQuery.of(context).size.width;

   

  Widget _detailContainer(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(image: NetworkImage(widget.clothes.imageUrl),
            height: 180,),
            SizedBox(height: 20,),
            Text(
              widget.clothes.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              widget.clothes.price.toString(),
              style: const TextStyle(
                  fontSize: 16, color: Color.fromARGB(148, 0, 0, 0)),
            ),
            Text(
              "Rating: ${widget.clothes.rating} | Terjual: ${widget.clothes.sold}",
              style: const TextStyle(
                  fontSize: 16, color: Color.fromARGB(148, 0, 0, 0)),
            ),
            const SizedBox(height: 16),
            const Text(
              "Description",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Category",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.clothes.category,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 16),
            ),
            const Text(
              "Brand",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.clothes.brand,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 16),),
              // ListView(
                
              // ),
              const SizedBox(height: 12),
              ElevatedButton(
                  onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Berhasil Ditambahkan"),
          duration: Durations.long2));
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 249, 155, 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6))),
                  child: const Text("Tambah Keranjang"),
                )
              
          ],
        ));
  }
}
