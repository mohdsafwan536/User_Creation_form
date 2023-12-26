// import 'dart:io';
//
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
//
// class MyFilePickerWidget extends StatefulWidget {
//   @override
//   _MyFilePickerWidgetState createState() => _MyFilePickerWidgetState();
// }
//
// class _MyFilePickerWidgetState extends State<MyFilePickerWidget> {
//   String? pickedFileName;
//   String? localFilePath;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         ElevatedButton(
//           onPressed: () async {
//             FilePickerResult? picked = await FilePicker.platform.pickFiles(
//               type: FileType.custom,
//               allowedExtensions: ['pdf'],
//             );
//
//             setState(() {
//               if (picked != null && picked.files.isNotEmpty) {
//                 pickedFileName = picked.files.first.name;
//                 print('File picked: $pickedFileName');
//
//                 // Store the file in local storage
//                 storeFileLocally(picked.files.first);
//
//                 // You can store or process the selected file here
//               } else {
//                 // User canceled the file picker or no file was picked
//                 pickedFileName = null;
//                 print('User canceled picking a file');
//               }
//             });
//           },
//           style: ElevatedButton.styleFrom(
//             primary: Color(0xff5801B7), // Button color on hover
//           ),
//           child: const Text(
//             'Upload PDF File',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         const SizedBox(width: 10), // Add some spacing between the button and the text
//         Text(
//           pickedFileName ?? '',
//           style: TextStyle(color: Colors.black), // Use the color you prefer
//         ),
//       ],
//     );
//   }
//
//   Future<void> storeFileLocally(PlatformFile file) async {
//     Directory appDocDir = await getApplicationDocumentsDirectory();
//     String appDocPath = appDocDir.path;
//     String filePath = '$appDocPath/${file.name}';
//
//     File localFile = File(filePath);
//     await localFile.writeAsBytes(file.bytes!);
//
//     setState(() {
//       localFilePath = filePath;
//     });
//
//     print('File stored locally: $localFilePath');
//   }
// }
