import 'package:get/get.dart';

import '../Model/note_model.dart';

class NoteController extends GetxController{
  List<NoteModel> nots = [];


  void creatNot(NoteModel note){
    nots.add(note);
    update();
  }








}

