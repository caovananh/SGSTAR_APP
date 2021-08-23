// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:infixedu/utils/model/Fee.dart';
import '../Utils.dart';

class FeeService {
  int _id;
  String _token;

  FeeService(this._id,this._token);

  List<Fee> feeMap = [];
  List<double> totalMap = [];

  bool isNullOrEmpty(Object o) => o == null || "" == o;

  Future<List<Fee>> fetchFee() async {
    feeMap.clear();

    //Utils.showToast(InfixApi.getFeesUrl(_id));

    final response = await http.get(Uri.parse(InfixApi.getFeesUrl(_id)),headers: Utils.setHeader(_token.toString()) );

    // prdynamic(response.statusCode);
    var jsonData = json.decode(response.body);

    bool isSuccess = jsonData['success'];
    var data = jsonData['data']['fees'];

    if (isSuccess) {
      for (var f in data) {
        feeMap.add(Fee(
            f['fees_name'],
            f['due_date'],
            f['amount'].toString(),
            f['paid'].toString(),
            f['balance'].toString(),
            this.isNullOrEmpty(f['discount_amount'])
                ? 0.toString()
                : f['discount_amount'].toString(),
            f['fine'].toString(),
            f['fees_type_id']));

        // print(this.isNullOrEmpty(f['discount_amount']));
      }
    } else {
      Utils.showToast('try again later');
    }

    return feeMap;
  }

  Future<List<double>> fetchTotalFee() async {
    totalMap.clear();
    double _amount = 0;
    double _discount = 0;
    double _fine = 0;
    double _paid = 0;
    double _balance = 0;

    final response = await http.get(Uri.parse(InfixApi.getFeesUrl(_id)),headers: Utils.setHeader(_token.toString()));

    var jsonData = json.decode(response.body);

    bool isSuccess = jsonData['success'];
    var data = jsonData['data']['fees'];
    // print(data);

    if (isSuccess) {
      for (var f in data) {
        f['amount'] == null ? _amount = 0 : _amount = _amount + f['amount'];
        this.isNullOrEmpty(f['discount_amount'])
            ? _discount = _discount + 0
            : _discount = _discount + f['discount_amount'];
        f['fine'] == null ? _fine = 0 : _fine = _fine + f['fine'];
        f['paid'] == null ? _paid = 0 : _paid = _paid + f['paid'];
        f['balance'] == null
            ? _balance = 0
            : _balance = _balance + f['balance'];
      }

      totalMap.add(_amount);
      totalMap.add(_discount);
      totalMap.add(_fine);
      totalMap.add(_paid);
      totalMap.add(_balance);
    } else {
      Utils.showToast('try again later');
    }

    return totalMap;
  }
}
