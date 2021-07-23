import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Network {
  static Map<String, String> headers = {};
  static Map<String, String> cookies = {};
  void _updateCookie(http.Response response) {
    String? allSetCookie = response.headers!['set-cookie'];

    if (allSetCookie != null) {

      var setCookies = allSetCookie.split(',');

      for (var setCookie in setCookies) {
        var cookies = setCookie.split(';');

        for (var cookie in cookies) {
          _setCookie(cookie);
        }
      }

      headers['cookie'] = _generateCookieHeader();
      headers['content-type'] = "text/json";
    }
  }

  void _setCookie(String rawCookie) {
    if (rawCookie.length > 0) {
      var keyValue = rawCookie.split('=');
      if (keyValue.length == 2) {
        var key = keyValue[0].trim();
        var value = keyValue[1];

        // ignore keys that aren't cookies
        if (key == 'path' || key == 'expires')
          return;
        this.cookies[key] = value;
      }
    }
  }

  
  Map<String, String> getHeadersCustom() {
    Map<String, String> headersToSend = {};
    headersToSend.addAll(headers);
    if (cookies.isNotEmpty)
      headersToSend.addEntries({MapEntry('cookie', _generateCookieHeader())});
    return headersToSend;
  }

  String _generateCookieHeader() {
    String cookie = "";

    for (var key in cookies.keys as Iterable) {
      if (cookie.length > 0)
        cookie += ";";
      cookie += key + "=" + cookies[key];
    }

    return cookie;
  }

  Future postLoginData(String username, String password) async {
    var responseData = " ";
    int responseStatusCode;
    Map getData = {};
    var url = Uri.parse(
        "https://murmuring-escarpment-87613.herokuapp.com/login");
    var response = await http.post(url,
        headers: getHeadersCustom(),
        body: {
          "username": username,
          "password": password
        }
    );
    _updateCookie(response);
    print(headers);
    responseStatusCode = response.statusCode;
    print(responseStatusCode);
    responseData = response.body;
    getData = {
      "statusCode": responseStatusCode,
      "message": responseData
    };
    return getData;
  }


  Future postSignData(String firstname, String lastname, String username,
      String mobile, String password, String aadhaar) async {
    var responseData = " ";
    int responseStatusCode;
    Map getData = {};
    var url = Uri.parse(
        "https://murmuring-escarpment-87613.herokuapp.com/register");
    var response = await http.post(url,
        headers: getHeadersCustom(),
        body: {
          "firstName": firstname,
          "lastName": lastname,
          "username": username,
          "mobileNo": mobile,
          "password": password,
          "aadharNo": aadhaar
        });
    responseStatusCode = response.statusCode;
    responseData = response.body;
    getData = {
      "statusCode": responseStatusCode,
      "message": responseData
    };
    return getData;
  }

  Future getUserData() async {
    var url = Uri.parse(
        "https://murmuring-escarpment-87613.herokuapp.com/viewdetails?inJSON=true");
    var response = await http.get(url, headers: getHeadersCustom());
    _updateCookie(response);
    print(headers);
    print(response.statusCode);
    print(response.body);
  }

}
