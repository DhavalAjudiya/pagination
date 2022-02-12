// import 'package:flutter/material.dart';
//
// class NewPage extends StatefulWidget {
//   const NewPage({Key? key}) : super(key: key);
//
//   @override
//   _NewPageState createState() => _NewPageState();
// }
//
// class _NewPageState extends State<NewPage> {
//   List<String> data = [];
//
//   fetchData() {
//     List<String> getData = data.length >= 200
//         ? []
//         : List.generate(20, (index) => "List DATA${index + data.length}");
//   }
//
//   ScrollController _controller = ScrollController();
//   getPsssenger() async {
//   }
//
//   fetchFive() {
//     for (int i = 0; i < 5; i++) {
//       getPsssenger();
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     fetchFive();
//     _controller.addListener(() {
//       if (_controller.position.pixels == _controller.position.maxScrollExtent) {
//         fetchFive();
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//   @override
//   void initState() {
//     fetchData();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("New Page"),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//               child: ListView.separated(
//                   itemBuilder: (context, index) {
//                     return Column(
//                       children: [
//                         Text("${data[index]}"),
//                       ],
//                     );
//                   },
//                   separatorBuilder: (context, index) => const Divider(
//                         thickness: 2,
//                       ),
//                   itemCount: data.length)),
//         ],
//       ),
//     );
//   }
// }
