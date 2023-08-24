import 'package:flutter/material.dart';
import 'package:st_credit/pages/clientInfo.dart';
import 'package:st_credit/pages/initialPage.dart';

class AnalystRequests extends StatefulWidget{

  @override
  _AnalystRequestsState createState() => _AnalystRequestsState();
}

class _AnalystRequestsState extends State<AnalystRequests>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Solicitações",
            style: TextStyle(color: Colors.black))),
        leading:  IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      InitialPage())),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: const TextField(
                decoration: InputDecoration(
                    hintText: 'Pesquisar',
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search)
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Carla Marques", style: TextStyle(color: Color(0xff000000),
                fontWeight: FontWeight.w700,
                fontSize: 15)),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ClientInfo()));
                  },
                  child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Text("Acessar",
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Antony Albuquerque", style: TextStyle(color: Color(0xff000000),
                    fontWeight: FontWeight.w700,
                    fontSize: 15)),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ClientInfo()));
                  },
                  child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Text("Acessar",
                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}