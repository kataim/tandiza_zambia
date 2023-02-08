import '../models/tandiza_client_entity.dart';

abstract class IUserInterface {
  Future<TandizaClient?> getUser();
}