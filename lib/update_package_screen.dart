import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UpdatePackageScreen extends StatefulWidget {
  final String packageId;
  final Map<String, dynamic> package;
  static const routeName = '/update-package';
  const UpdatePackageScreen(this.packageId, this.package, {Key key})
      : super(key: key);

  @override
  State<UpdatePackageScreen> createState() => _UpdatePackageScreenState();
}

class _UpdatePackageScreenState extends State<UpdatePackageScreen> {
  var data = {
    'title': '',
    'price': '',
    'hours': '',
    'description': '',
  };

  final _formKey = GlobalKey<FormState>();

  Future<void> _updatePackage() async {
    if (!_formKey.currentState.validate()) return;

    _formKey.currentState.save();
    try {
      await FirebaseFirestore.instance
          .collection('packages')
          .doc(widget.packageId)
          .update(data);
      _formKey.currentState.reset();
      await showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Success'),
          content: const Text('Package was updated successfully.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      Navigator.of(context).pop();
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Package'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
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
            height: 40,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Title'),
                    ),
                    keyboardType: TextInputType.text,
                    initialValue: widget.package['title'],
                    enabled: false,
                    validator: (val) {
                      if (val.isEmpty) return "Invalid title!";
                      return null;
                    },
                    onSaved: (val) => data['title'] = val,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Price'),
                    ),
                    keyboardType: TextInputType.number,
                    initialValue: widget.package['price'],
                    validator: (val) {
                      if (double.tryParse(val) == null ||
                          double.tryParse(val) < 1) {
                        return 'Invalid price!';
                      }
                      return null;
                    },
                    onSaved: (val) => data['price'] = val,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Total hours'),
                    ),
                    initialValue: widget.package['hours'],
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
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Description'),
                    ),
                    keyboardType: TextInputType.text,
                    initialValue: widget.package['description'],
                    validator: (val) {
                      if (val.isEmpty) return "Invalid description!";
                      return null;
                    },
                    onSaved: (val) => data['description'] = val,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _updatePackage,
                    child: const Text('Update'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
