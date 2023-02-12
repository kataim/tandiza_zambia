import 'dart:convert';
import 'dart:io';
import 'package:tandiza/datalayer/models/tandiza_client_model.dart';
import 'package:http/http.dart' as http;


class LoanManagementApi {
  Future<TandizaClientModel?> getUserByNrc (String id) async {
    String url = 'https://nek-runaloan.calidad.co.za/tdzapi/client?nrcnumber=$id';
      final response = await http.get(Uri.parse(url), headers: {
        'Accept' : 'application/json',
        'Content-Type' : 'application/json',
        'Authorisation' : 'Tandiza210Rocks1964',
        'Tenant' : 'TDZ'
      });

      if(response.statusCode == 200){
        return TandizaClientModel.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('Failed to get data');
      }
  }
}