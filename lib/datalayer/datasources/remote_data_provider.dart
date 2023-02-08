import 'dart:convert';
import 'dart:io';
import 'package:tandiza/datalayer/models/tandiza_client_model.dart';
import 'package:http/http.dart' as http;


class RemoteDataProvider {
  Future<TandizaClientModel?> getUser () async {
    String url = 'https://nek-runaloan.calidad.co.za/tdzapi/client?nrcnumber=437657/67/1';
      final response = await http.get(Uri.parse(url), headers: {
        HttpHeaders.authorizationHeader : 'Tandiza210Rocks1964',
        HttpHeaders.acceptHeader : 'application/json',
        'Tenant' : 'TDZ'
      });

      if(response.statusCode == 200){
        return TandizaClientModel.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('Failed to get data');
      }
  }
}