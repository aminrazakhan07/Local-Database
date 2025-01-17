import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:local_database/HiveDatabase/Widgets/ShowDialog.dart';

class HomeHive extends StatefulWidget {
  const HomeHive({super.key});

  @override
  State<HomeHive> createState() => _HomeHiveState();
}

class _HomeHiveState extends State<HomeHive> {
  //
  Box? studentBox;
  @override
  void initState() {
    studentBox = Hive.box('students');
    super.initState();
  }

  //
  TextEditingController rollNoController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('Hive Database'),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.lightBlueAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Studentns Details'),
              Row(
                children: [
                  ValueListenableBuilder(
                    valueListenable: studentBox!.listenable(),
                    builder: (context, Box studentBox, _) {
                      return ListView.builder(itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(studentBox.keyAt(index)),
                          subtitle: Text(studentBox.getAt(index)),
                        );
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //1
                  Column(
                    children: [
                      //1
                      ElevatedButton(
                        onPressed: () {
                          //
                          studentBox?.put(
                              rollNoController.text, nameController.text);

                          rollNoController.clear();
                          nameController.clear();
                          Navigator.pop(context);

                          ////
                          // Get.dialog();
                          CustomDialog.showCustomDialog(
                            context: context,
                            primaryController: rollNoController,
                            secondaryController: nameController,
                            lblTextName: 'Studen Name',
                            lblTextRol: 'Roll Number',
                            subButtn: 'Add',
                            cancel: 'Cansil',
                            inputType: TextInputType.numberWithOptions(),
                          );
                        },
                        child: Text('Add Student'),
                      ),
                      //
                      SizedBox(height: 20),
                      //2
                      ElevatedButton(
                        onPressed: () {
                          studentBox?.put(
                              rollNoController.text, nameController.text);

                          rollNoController.clear();
                          nameController.clear();
                          Navigator.pop(context);

                          //
                          CustomDialog.showCustomDialog(
                            context: context,
                            primaryController: rollNoController,
                            secondaryController: nameController,
                            lblTextName: 'Update Name',
                            lblTextRol: 'Update Number',
                            subButtn: 'Update',
                            cancel: 'Cansil',
                          );
                        },
                        child: Text('Update Student'),
                      ),
                    ],
                  ),
                  //2
                  Column(
                    children: [
                      //3
                      ElevatedButton(
                        onPressed: () {
                          studentBox?.delete(rollNoController.text);
                          rollNoController.clear();
                          Navigator.pop(context);
                          //
                          CustomDialog.showCustomDialog(
                            context: context,
                            primaryController: rollNoController,
                            lblTextName: 'Delete Name',
                            subButtn: 'Delete',
                            cancel: 'Cansil',
                          );
                        },
                        child: Text('Delete Student'),
                      ),
                      //4
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          //
                          print(
                            studentBox?.get(rollNoController.text),
                          );
                          rollNoController.clear();
                          Navigator.pop(context);
                          //
                          CustomDialog.showCustomDialog(
                            context: context,
                            primaryController: nameController,
                            lblTextName: 'Student Naem',
                            subButtn: 'Show',
                            cancel: 'Cansil',
                          );
                        },
                        child: Text('Show Student'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
