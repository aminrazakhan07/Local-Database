import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sharedhome extends StatefulWidget {
  const Sharedhome({super.key});

  @override
  State<Sharedhome> createState() => _SharedhomeState();
}

class _SharedhomeState extends State<Sharedhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('Students Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //
            FutureBuilder(
              future: SharedPreferences.getInstance(),
              builder: (context, snap) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(snap.data?.getString('name').toString() ?? ''),
                    Text(snap.data?.getInt('age').toString() ?? ''),
                    Text(snap.data?.getDouble('percent').toString() ?? ''),
                    Text(snap.data?.getBool('isLogin').toString() ?? ''),
                  ],
                );
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    overlayColor: WidgetStateProperty.all(Colors.cyan),
                    shadowColor: WidgetStatePropertyAll(Colors.pinkAccent),
                    elevation: WidgetStateProperty.all(2.5),
                    backgroundColor: WidgetStateProperty.all(Colors.blue),
                  ),
                  onPressed: () async {
                    SharedPreferences sp =
                        await SharedPreferences.getInstance();
                    sp.setInt('age', 32);
                    sp.setString('name', 'Raza');
                    sp.setDouble('percent', 78.5);
                    sp.setBool('isLogin', true);
                    print('Clicked');
                    setState(() {});
                  },
                  child: Text('Add Data'),
                ),
                SizedBox(height: 20),
                FilledButton(
                  style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    overlayColor: WidgetStateProperty.all(Colors.cyan),
                    shadowColor: WidgetStatePropertyAll(Colors.pinkAccent),
                    surfaceTintColor: WidgetStatePropertyAll(Colors.red),
                    elevation: WidgetStateProperty.all(2.5),
                    backgroundColor: WidgetStateProperty.all(Colors.blue),
                  ),
                  onPressed: () async {
                    SharedPreferences sp =
                        await SharedPreferences.getInstance();
                    //

                    // print('Name: ${sp.getString('name')}');
                    // print('Age: ${sp.getInt('age')}');
                    // print('Percent: ${sp.getDouble('percent')}');
                    // print('Sate: ${sp.getBool('isLogin')}');
                    //
                    sp.remove('name');
                    sp.remove('age');
                    setState(() {});
                  },
                  child: Text('Remove Data'),
                  //
                ),
              ],
            ),

            // SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
