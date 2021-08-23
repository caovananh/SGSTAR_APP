// Dart imports:
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

// Project imports:
import 'package:infixedu/utils/CustomAppBarWidget.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:infixedu/utils/exception/DioException.dart';
import 'package:infixedu/utils/model/Bank.dart';
import 'package:infixedu/utils/model/Fee.dart';
import 'package:infixedu/utils/model/UserDetails.dart';
import 'package:infixedu/utils/widget/ScaleRoute.dart';
import 'package:infixedu/utils/widget/fees_payment_row_widget.dart';

class FeePaymentMain extends StatefulWidget {
  final Fee fee;
  final String id;

  FeePaymentMain(this.fee, this.id);

  @override
  _FeePaymentMainState createState() => _FeePaymentMainState();
}

class _FeePaymentMainState extends State<FeePaymentMain> {
  String _email;

  @override
  void initState() {
    Utils.getStringValue('email').then((value) {
      _email = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.indigo, //or set color with: Color(0xFF0000FF)
    ));

    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Scaffold(
        appBar: CustomAppBarWidget(
          title: 'Payment',
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    ScaleRoute(
                        page: BankOrCheque(
                            widget.id, widget.fee, _email, 'Bank Payment')));
              },
              child: Card(
                elevation: 4.0,
                child: ListTile(
                  contentPadding: EdgeInsets.all(15),
                  leading: CircleAvatar(
                    radius: 25.0,
                    backgroundColor: Colors.white,
                    child: Container(
                      width: ScreenUtil().setWidth(25),
                      child: Image.asset(
                        'assets/images/fees_icon.png',
                      ),
                    ),
                  ),
                  title: Text(
                    'Bank Payment',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    ScaleRoute(
                        page: BankOrCheque(
                            widget.id, widget.fee, _email, 'Cheque Payment')));
              },
              child: Card(
                elevation: 4.0,
                child: ListTile(
                  contentPadding: EdgeInsets.all(15),
                  leading: CircleAvatar(
                    radius: 25.0,
                    backgroundColor: Colors.white,
                    child: Container(
                      width: ScreenUtil().setWidth(25),
                      child: Image.asset(
                        'assets/images/fees_icon.png',
                      ),
                    ),
                  ),
                  title: Text(
                    'Cheque Payment',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class BankOrCheque extends StatefulWidget {
  final Fee fee;
  String email;
  final String id;
  final String paymentType;

  BankOrCheque(this.id, this.fee, this.email, this.paymentType);

  @override
  _BankOrChequeState createState() => _BankOrChequeState();
}

class _BankOrChequeState extends State<BankOrCheque> {
  TextEditingController amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File _file;
  String amount;
  bool isResponse = false;
  String _token;
  Future bank;
  String _selectedBank;
  String bankAccountName;
  String bankAccountNumber;
  int bankId;
  bool bankAvailable = true;
  DateTime _dateTime;
  var paymentDate;
  var paymentUrl;

  @override
  void initState() {
    Utils.getStringValue('token').then((value) {
      log(value);
      setState(() {
        _token = value;
        bank = getBankList();
        bank.then((value) {
          _selectedBank =
              value.banks.length != 0 ? value.banks[0].bankName : '';
          bankId = value.banks.length != 0 ? value.banks[0].id : 0;
          bankAccountName =
              value.banks.length != 0 ? value.banks[0].accountName : '';
          bankAccountNumber =
              value.banks.length != 0 ? value.banks[0].accountNumber : '';
          print(
              'Bank ID: $bankId, Bank Selected: $_selectedBank, Account Name: $bankAccountName, Account Name: $bankAccountNumber');
          if (widget.paymentType == "Bank Payment") {
            if (value.banks.length == 0) {
              bankAvailable = false;
            }
          } else {
            bankAvailable = true;
          }
        });
      });
    });
    amount = '${absoluteAmount(widget.fee.balance)}';
    print(amount);
    amountController.text = amount;

    _dateTime = DateTime.now();
    paymentDate =
        '${_dateTime.year}-${getAbsoluteDate(_dateTime.month)}-${getAbsoluteDate(_dateTime.day)}';

    super.initState();
  }

  Future pickDocument() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _file = File(result.files.single.path);
      });
    } else {
      Utils.showToast('Cancelled');
    }
  }

  Future<BankList> getBankList() async {
    final response = await http.get(Uri.parse(InfixApi.bankList),
        headers: Utils.setHeader(_token.toString()));

    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return BankList.fromJson(jsonData['data']['banks']);
    } else {
      throw Exception('Failed to load from api');
    }
  }

  int getCode<T>(T t, String title) {
    int code;
    for (var cls in t) {
      if (cls.bankName == title) {
        code = cls.id;
        break;
      }
    }
    return code;
  }

  String getBankAccountName<T>(T t, String title) {
    String code;
    for (var cls in t) {
      if (cls.bankName == title) {
        code = cls.accountName;
        break;
      }
    }
    print('CODE:$code');
    return code;
  }

  String getBankAccountNumber<T>(T t, String title) {
    String code;
    for (var cls in t) {
      if (cls.bankName == title) {
        code = cls.accountNumber;
        break;
      }
    }
    return code;
  }

  Future submitPayment(context, user) async {
    if (_formKey.currentState.validate()) {
      if (_file != null) {
        if (widget.paymentType == "Bank Payment") {
          paymentUrl = InfixApi.childFeeBankPayment(
              amountController.text,
              user.classId,
              user.sectionId,
              widget.id,
              widget.fee.id,
              'bank',
              paymentDate,
              bankId);
        } else {
          paymentUrl = InfixApi.childFeeChequePayment(
              amountController.text,
              user.classId,
              user.sectionId,
              widget.id,
              widget.fee.id,
              'cheque',
              paymentDate);
        }
        print(paymentUrl);

        setState(() {
          isResponse = true;
        });
        FormData formData;
        if (widget.paymentType == "Bank Payment") {
          formData = FormData.fromMap({
            "amount": amountController.text,
            "class_id": user.classId,
            "section_id": user.sectionId,
            "student_id": 1,
            "fees_type_id": widget.fee.id,
            "payment_mode": 'bank',
            "date": paymentDate,
            "bank_id": bankId,
            "slip": await MultipartFile.fromFile(_file.path),
          });
        } else {
          formData = FormData.fromMap({
            "amount": amountController.text,
            "class_id": user.classId,
            "section_id": user.sectionId,
            "student_id": 1,
            "fees_type_id": widget.fee.id,
            "payment_mode": 'bank',
            "date": paymentDate,
            "bank_id": bankId,
            "slip": await MultipartFile.fromFile(_file.path),
          });
        }
        Response response;
        var dio = Dio();

        response = await dio.post(
          paymentUrl,
          data: formData,
          options: Options(
            headers: {
              "Accept": "application/json",
              "Authorization": _token.toString(),
            },
          ),
          onSendProgress: (received, total) {
            if (total != -1) {
              print((received / total * 100).toStringAsFixed(0) + '%');
            }
          },
        ).catchError((e) {
          final errorMessage = DioExceptions.fromDioError(e).toString();
          print(errorMessage);
          Utils.showToast(errorMessage);
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        });
        print(response.statusCode);
        if (response.statusCode == 200) {
          setState(() {
            isResponse = false;
          });
          print(response.data);
          var data = json.decode(response.toString());

          print(data['success']);

          print(data);
          if (data['success'] == true) {
            Utils.showToast('Payment added. Please wait for approval');
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          } else {
            Utils.showToast('Some error occurred');
          }
        } else {
          setState(() {
            isResponse = true;
          });
        }
      } else {
        Utils.showToast('Please select file');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.indigo, //or set color with: Color(0xFF0000FF)
    ));

    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Scaffold(
        appBar: CustomAppBarWidget(
          title: widget.paymentType,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: FutureBuilder<UserDetails>(
              future: fetchUserDetails(widget.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final user = snapshot.data;
                  return Container(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: FeePaymentRow(widget.fee),
                          ),
                          // Utils.checkTextValue("CLASS",user.classId),
                          widget.paymentType == "Bank Payment"
                              ? FutureBuilder<BankList>(
                                  future: bank,
                                  builder: (context, snapshot) {
                                    print(snapshot.data);
                                    if (snapshot.hasData) {
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Column(
                                          children: [
                                            DropdownButton(
                                              elevation: 0,
                                              isExpanded: true,
                                              items: snapshot.data.banks
                                                  .map((item) {
                                                return DropdownMenuItem<String>(
                                                  value: item.bankName,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Text(item.bankName),
                                                  ),
                                                );
                                              }).toList(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4
                                                  .copyWith(fontSize: 15.0),
                                              onChanged: (value) {
                                                setState(() {
                                                  _selectedBank = value;
                                                  bankId = getCode(
                                                      snapshot.data.banks,
                                                      value);
                                                  bankAccountName =
                                                      getBankAccountName(
                                                          snapshot.data.banks,
                                                          value);
                                                  bankAccountNumber =
                                                      getBankAccountNumber(
                                                          snapshot.data.banks,
                                                          value);
                                                  debugPrint(
                                                      'User select $bankId');
                                                });
                                              },
                                              value: _selectedBank,
                                            ),
                                            ListTile(
                                              contentPadding:
                                                  EdgeInsets.only(left: 8),
                                              title: Text(
                                                bankAccountName,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5
                                                    .copyWith(fontSize: 14),
                                              ),
                                              subtitle: Text(bankAccountNumber,style: Theme.of(context)
                                                  .textTheme
                                                  .headline5
                                                  .copyWith(fontSize: 12,fontWeight: FontWeight.normal),),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      return Container();
                                    }
                                  })
                              : Container(),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: false, signed: false),
                              style: Theme.of(context).textTheme.headline6,
                              controller: amountController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (String value) {
                                RegExp regExp = new RegExp(r'^[0-9]*$');
                                if (value.isEmpty) {
                                  return 'Please enter a valid amount';
                                }
                                if (int.tryParse(value) == 0) {
                                  return 'Amount must be greater than 0';
                                }
                                if (!regExp.hasMatch(value)) {
                                  return 'Please enter a number';
                                }
                                if (int.tryParse(value) >
                                    int.tryParse(widget.fee.balance)) {
                                  return 'Amount must not greater than balance';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Amount",
                                labelText: "Amount",
                                labelStyle:
                                    Theme.of(context).textTheme.headline4,
                                errorStyle: TextStyle(
                                    color: Colors.pinkAccent, fontSize: 15.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              pickDocument();
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.3)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 20.0),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          _file == null
                                              ? widget.paymentType ==
                                                      "Bank Payment"
                                                  ? 'Select Bank payment slip'
                                                  : 'Select Cheque payment slip'
                                              : _file.path.split('/').last,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4
                                              .copyWith(),
                                          maxLines: 2,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Browse',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          .copyWith(
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          bankAvailable
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10),
                                  child: GestureDetector(
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width,
                                      height: 50.0,
                                      decoration: Utils.gradientBtnDecoration,
                                      child: Text(
                                        "PAY",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                    onTap: () {
                                      submitPayment(context, user);
                                    },
                                  ),
                                )
                              : Container(
                                  child: Text(
                                    "No Bank Available for payment. Please use a different payment method.",
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: isResponse == true
                                ? LinearProgressIndicator(
                                    backgroundColor: Colors.transparent,
                                  )
                                : Text(''),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
              }),
        ),
      ),
    );
  }

  Future<UserDetails> fetchUserDetails(id) async {
    final response = await http.get(Uri.parse(InfixApi.getChildren(id)),
        headers: Utils.setHeader(_token.toString()));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return UserDetails.fromJson(jsonData['data']['userDetails']);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load from api');
    }
  }

  int absoluteAmount(String am) {
    int amount = int.parse(am);
    if (amount < 0) {
      return -amount;
    } else {
      return amount;
    }
  }

  String getAbsoluteDate(int date) {
    return date < 10 ? '0$date' : '$date';
  }
}
