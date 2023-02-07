import '../models/tandiza_client_entity.dart';

abstract class IUserRepository {
  Future<TandizaClient?> getUser();
}