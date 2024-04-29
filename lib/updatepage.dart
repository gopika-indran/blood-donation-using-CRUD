import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class updatepage extends StatefulWidget {
  final DocumentSnapshot documentSnapshot;
  const updatepage({super.key, required this.documentSnapshot});

  @override
  State<updatepage> createState() => _updatepageState();
}

class _updatepageState extends State<updatepage> {
  final bloodgroup = ["A-", "A+", "AB+", "AB-", "B+", "B-", "O-", "O+"];
  String? selectedgroup;
  final CollectionReference donor =
      FirebaseFirestore.instance.collection("donor");
  TextEditingController namecontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();
  @override
  void initState() {
    namecontroller =
        TextEditingController(text: widget.documentSnapshot["name"]);
    numbercontroller =
        TextEditingController(text: widget.documentSnapshot["number"]);
    selectedgroup = widget.documentSnapshot["blood group"];
    super.initState();
  }

  void updatedata() {
    widget.documentSnapshot.reference.update({
      "blood group": selectedgroup,
      "name": namecontroller.text,
      "number": numbercontroller.text,
    }).then((_) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Updated Successfully")));
    }).catchError((error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Failed to update :$error")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Details"),
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
                value: selectedgroup,
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
                  updatedata();
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                      const Size(double.infinity, 50)),
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                child: const Text(
                  "Update",
                  style: TextStyle(fontSize: 20),
                )),
          )
        ],
      ),
    );
  }
}
