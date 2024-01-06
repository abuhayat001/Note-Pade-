import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lesson_14/Model/note_model.dart';
import '../Controller/notecontroller.dart';
class NoteScreen extends StatelessWidget {
  NoteScreen({Key? key}) : super(key: key);
  Color blueColor = Colors.lightBlue;
  TextEditingController idClt = TextEditingController();
  TextEditingController nameClt = TextEditingController();
  TextEditingController depClt = TextEditingController();
  TextEditingController sftClt = TextEditingController();
  NoteController noteClt = Get.put(NoteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MY NOTE",style: TextStyle(color: Colors.blue),),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors,
        child: GetBuilder<NoteController>(builder: (_){
          return ListView.builder(
            itemCount: noteClt.nots.length,
              itemBuilder:(context,index){
              return Card(
                color: Colors.white,
                child: ListTile(
                  leading: Text(noteClt.nots[index].id,),
                  title: Text(noteClt.nots[index].name,),
                  subtitle: Text(noteClt.nots[index].department,),
                  trailing: Text(noteClt.nots[index].shift),


                ),
              );
              });
        },),
      ),



      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showDialogue(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  _showDialogue(BuildContext context){

    return showDialog(context: context, builder:(_){
      return Center(
        child: SingleChildScrollView(
          child: AlertDialog(
            backgroundColor: Colors.black,
            content: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Container(
                    height: 37,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                        topRight: Radius.circular(41.0),
                        bottomLeft: Radius.circular(41.0),
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: TextField(
                        controller: idClt,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Student ID'
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 14.0,),
                  Container(
                    height: 37,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(41.0),
                          bottomLeft: Radius.circular(41.0),
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: TextField(
                        controller: nameClt,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Student Name'
                        ),

                      ),
                    ),
                  ),
                  SizedBox(height: 14.0,),
                  Container(
                    height: 37,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(41.0),
                          bottomLeft: Radius.circular(41.0),
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: TextField(
                        controller: depClt,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Student department'
                        ),

                      ),
                    ),
                  ),
                  SizedBox(height: 14.0,),
                  Container(
                    height: 37,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(41.0),
                          bottomLeft: Radius.circular(41.0),
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: TextField(
                        controller: sftClt,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                            hintText: 'Shift',
                        ),

                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              },
                  child: Text("Cancle", style: TextStyle(color: Colors.black),) ,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
              SizedBox(width: 30.0,),
              ElevatedButton(onPressed: (){
                noteClt.creatNot(NoteModel(idClt.text,nameClt.text, depClt.text, sftClt.text));
                Navigator.pop(context);
              },
                child: Text("Submit", style: TextStyle(color: Colors.white),) ,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              ),
            ],
          ),
        ),
      );
    });
  }
}
