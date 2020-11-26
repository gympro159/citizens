import 'package:citizens/widgets/createRequire/formInput.dart';
import 'package:flutter/material.dart';

class CreateRequireScreen extends StatefulWidget {
  CreateRequireScreen({Key key}) : super(key: key);

  @override
  _CreateRequireScreenState createState() => _CreateRequireScreenState();
}

class _CreateRequireScreenState extends State<CreateRequireScreen> {
  TextEditingController _controllerName;
  TextEditingController _controllerPhone;
  TextEditingController _controllerNote;

  @override
  void initState() {
    super.initState();
    _controllerName = TextEditingController();
    _controllerPhone = TextEditingController();
    _controllerNote = TextEditingController();
  }

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerPhone.dispose();
    _controllerNote.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 30),
            FormInput(
                controller: _controllerName,
                title: 'Họ và tên',
                imposition: true,
                maxLine: 1),
            FormInput(
                controller: _controllerPhone,
                title: 'Số điện thoại',
                imposition: true,
                maxLine: 1,
                type: TextInputType.number),
            Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vị trí hiện tại',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.all(5),
                              child: Image.asset(
                                  'lib/assets/images/iconsCreateRequire/gpsHere.png',
                                  fit: BoxFit.fill,
                                  height: 25)),
                          SizedBox(width: 10),
                          Flexible(
                            child: Text(
                              '271 Nguyễn Văn Linh, Vĩnh Trung, Thanh Khê, Đà Nẵng',
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        ])
                  ],
                )),
            FormInput(controller: _controllerNote, title: 'Ghi chú'),
            Center(
                child: RaisedButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0)),
              padding: const EdgeInsets.all(0.0),
              child: Ink(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xff01A8A1), Color(0xff54CC82)],
                      begin: const FractionalOffset(0.5, 0.0),
                      end: const FractionalOffset(0.5, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                  borderRadius: BorderRadius.all(Radius.circular(80.0)),
                ),
                child: Container(
                  constraints: const BoxConstraints(
                      maxWidth: 200.0,
                      minHeight: 36.0), // min sizes for Material buttons
                  alignment: Alignment.center,
                  child: const Text(
                    'Gửi yêu cầu',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )),
            Padding(padding: EdgeInsets.only(bottom: 100))
          ]),
        ));
  }
}
