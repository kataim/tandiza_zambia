import 'package:tandiza/datalayer/datasources/remote_data_provider.dart';
import 'package:tandiza/domain/models/tandiza_client_entity.dart';
import 'package:tandiza/domain/repository/user_repository_interface.dart';

class UserRepository implements IUserRepository {

  final RemoteDataProvider remoteDataProvider;
  UserRepository({required this.remoteDataProvider});
  @override
  Future<TandizaClient?> getUser() async {
    // TODO: implement getUser
    try{
      final TandizaClient ? tandizaClient = await remoteDataProvider.getUser();
      return tandizaClient;
    } catch (e){
      print(e);
    }
  }

}