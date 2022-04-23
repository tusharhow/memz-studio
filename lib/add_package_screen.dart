import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddPackageScreen extends StatefulWidget {
  static const routeName = '/add-package';
  const AddPackageScreen({Key key}) : super(key: key);

  @override
  State<AddPackageScreen> createState() => _AddPackageScreenState();
}

class _AddPackageScreenState extends State<AddPackageScreen> {
  var data = {
    'title': '',
    'price': '',
    'hours': '',
    'description': '',
  };

  final _formKey = GlobalKey<FormState>();

  Future<void> _addPackage() async {
    if (!_formKey.currentState.validate()) return;

    _formKey.currentState.save();
    try {
      final docsRef = await FirebaseFirestore.instance
          .collection('packages')
          .where('title', isEqualTo: data['title'].trim())
          .get();
      final isTitleExists = docsRef.docs.isNotEmpty;
      if (isTitleExists) {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Error'),
            content: const Text('Package title already exists!'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
        return;
      }
      await FirebaseFirestore.instance.collection('packages').add(data);
      _formKey.currentState.reset();
      Navigator.of(context).pop();
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Package'),
        centerTitle: true,
      ),
      body: Stack(children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            "assets/images/bg.png",
            fit: BoxFit.cover,
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(
        //     top: 30,
        //     right: 30,
        //     left: 20,
        //   ),
        //   child: Image.asset(
        //     "assets/images/menu.png",
        //     height: 40,
        //     width: 40,
        //   ),
        // ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 170,
            // right: 30,
            // left: 70,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Title'),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val.isEmpty) return "Invalid title!";
                      return null;
                    },
                    onSaved: (val) => data['title'] = val,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Price'),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (val) {
                      if (double.tryParse(val) == null ||
                          double.tryParse(val) < 1) {
                        return 'Invalid price!';
                      }
                      return null;
                    },
                    onSaved: (val) => data['price'] = val,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Total hours (HH:MM)'),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5),
                      ),
                    ),
                    inputFormatters: [
                      MaskTextInputFormatter(
                        mask: '##:##',
                      ),
                    ],
                    keyboardType: TextInputType.number,
                    validator: (val) {
                      if (val.isEmpty || val == "00:00" || val.length != 5)
                        return "Invalid hours!";
                      else if (int.parse(val.substring(0, 2)) > 8)
                        return 'Hours cant be more than 8';
                      return null;
                    },
                    onSaved: (val) => data['hours'] = val,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Description'),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (val) {
                      if (val.isEmpty) return "Invalid description!";
                      return null;
                    },
                    onSaved: (val) => data['description'] = val,
                  ),
                  const SizedBox(height: 60),
                  ElevatedButton(
                    onPressed: _addPackage,
                    child: const Text('Add'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 40),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
