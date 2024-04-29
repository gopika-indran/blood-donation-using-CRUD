import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class addpage extends StatefulWidget {
  const addpage({super.key});

  @override
  State<addpage> createState() => _addpageState();
}

class _addpageState extends State<addpage> {
  final bloodgroup = ["A-", "A+", "AB+", "AB-", "B+", "B-", "O-", "O+"];
  String? selectedgroup;
  final CollectionReference donor =
      FirebaseFirestore.instance.collection("donor");
  TextEditingController namecontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();
  void addDonor() {
    final savedonor = {
      "blood group": selectedgroup,
      "name": namecontroller.text,
      "number": numbercontroller.text,
    };
    donor.add(savedonor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Details"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: namecontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  label: const Text("Donor Name")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: numbercontroller,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  label: const Text("Donor Number")),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField(
                decoration: const InputDecoration(
                    label: Text(
                  "select your blood group",
                  style: TextStyle(color: Colors.red),
                )),
                items: bloodgroup
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (val) {
                  selectedgroup = val;
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  addDonor();
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                      const Size(double.infinity, 50)),
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                child: const Text(
                  "submit",
                  style: TextStyle(fontSize: 20),
                )),
          )
        ],
      ),
    );
  }
}
