// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class UploadDialog extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//      showDialog(context: context,barrierDismissible: true, builder: (context){
//        return AlertDialog(
//               title: Text('Quick actions?', style: TextStyle(color: darkBG, fontSize:20)),
//               content: Text('Choose from the options below'),
//               actions: <Widget>[
//                 FlatButton(onPressed: () async{
//                   file = picker.getImage(source: ImageSource.camera).whenComplete(() {
//                      setState(()  {                 
//                    //  if(image != null){
//                    // file = File(image.path);
                    
//                  //   }
//                    //file = null;
//                   });
//                     //base64Image = base64Encode();
//                     //fileName = file.path.split("/").last;
//                    // print(base64Image);
//                    // print(fileName);
//                   });
//                 // var image =  await picker.getImage(source: ImageSource.camera);
//                 // print(image);
                 
//                 },
//                  child: Text('use camera', style: TextStyle(color: darkBG, fontSize: 20))),

//                 FlatButton(onPressed: () async{
//                   file = picker.getImage(source: ImageSource.gallery).whenComplete(() {
//                      setState(()  {                 
//                    //  if(image != null){
//                    // file = File(image.path);
                    
//                  //   }
//                    //file = null;
//                   });
//                     //base64Image = base64Encode();
//                     //fileName = file.path.split("/").last;
//                    // print(base64Image);
//                    // print(fileName);
//                   });
//                 // var image =  await picker.getImage(source: ImageSource.camera);
//                 // print(image);
                 
//                 }, child: Text('choose from gallery',style: TextStyle(color: darkBG, fontSize: 20)))
//              ],

//              );

//     });
//   }
// }

