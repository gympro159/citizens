import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  const FormInput(
      {Key key,
      @required TextEditingController controller,
      @required this.title,
      this.imposition,
      this.maxLine,
      this.type})
      : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final String title;
  final bool imposition;
  final int maxLine;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                imposition == true
                    ? Text(
                        '*',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      )
                    : SizedBox(),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              maxLengthEnforced: false,
              maxLines: maxLine,
              keyboardType: type != null ? type : TextInputType.text,
              controller: _controller,
              style: TextStyle(fontSize: 20),
              decoration: new InputDecoration(
                contentPadding: new EdgeInsets.all(12.0),
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.circular(10)),
                hintText: title,
              ),
              onSubmitted: (String value) async {
                await showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Thanks!'),
                      content: Text('You typed "$value".'),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
            )
          ],
        ));
  }
}
