import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_inventory/core/vos/drop_down_vo.dart';
import '../../../../view_model/add_product_view_model.dart';
import '../../../widget/custom_drop_down_button.dart';
import '../../../widget/text_view.dart';

class DropDownTest extends StatefulWidget {
  const DropDownTest({Key? key}) : super(key: key);

  @override
  State<DropDownTest> createState() => _DropDownTestState();
}

class _DropDownTestState extends State<DropDownTest> {
  final addProductVm = Get.find<AddProductViewModel>();
  List<ServerModel> serverModels = <ServerModel>[
    ServerModel(name: 'Default', url: 'https:defaultServer.com/'),
    ServerModel(name: 'Alpha', url: 'https://alphaServer.com/'),
    ServerModel(name: 'Beta', url: 'https://betaServer.com/'),
  ];

  List<DropDownVo> mDrop = [
    DropDownVo(id: "1",title: "test"),
    DropDownVo(id: "2",title: "test2"),
  ];
  DropDownVo? vo;
  ServerModel? selectedServer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(title:const Text("Testing"),),
      body: Center(
        child:   Column(
          children: [
            DropdownButton<ServerModel>(
              value: selectedServer,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              hint: Text("Please Select"),
              style: TextStyle(color: Colors.purple[700]),
              underline: Container(
                height: 2,
                color: Colors.purple[700],
              ),
              onChanged: (ServerModel? newServer) {
                setState(() {
                  selectedServer = newServer;
                });
              },
              items: serverModels.map((ServerModel map) {
                return  DropdownMenuItem<ServerModel>(
                    value: map, child: Text(map.name));
              }).toList(),
            ),
            SizedBox(height: 50,),
            DropdownButton<DropDownVo>(
              value: vo,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              hint: Text("Please Select"),
              style: TextStyle(color: Colors.purple[700]),
              underline: Container(
                height: 2,
                color: Colors.purple[700],
              ),
              onChanged: (DropDownVo? newServer) {
                setState(() {
                  vo = newServer;
                });
              },
              items: mDrop.map((DropDownVo map) {
                return  DropdownMenuItem<DropDownVo>(
                    value: map, child: Text(map.title??""));
              }).toList(),
            ),
           SizedBox(height: 50,),
            SizedBox(height: 50,),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('category').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<DropDownVo> categoryList = [];


                  for (int i = 0; i < snapshot.data!.docs.length; i++) {
                    DocumentSnapshot doc = snapshot.data!.docs[i];

                    categoryList.add(DropDownVo(title: doc["type"],id: i.toString()));
                  }

                  return  CustomDropDownButton(
                      hintText: "Select Category",
                      dropDownList:  categoryList,
                      value:  vo,

                    onChanged: (DropDownVo? newServer) {
                      setState(() {
                        vo = newServer;
                      });
                    },

                          isSelected: false,

                  );
                }
                if (snapshot.hasError) {
                  return const TextView(text: "Error on Category");
                } else {
                  return const TextView(text: "No Category Found");
                }
              },
            )
          ],
        ),
      ),

    );
  }
}


class ServerModel {
  ServerModel({required this.name,required this.url});

  String name;
  String url;
}