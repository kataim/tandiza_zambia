import 'package:tandiza/domain/repository/user_repository_interface.dart';
import '../domain/models/tandiza_client_entity.dart';
import '../domain/usecases/user_application_interface.dart';

class GetUser implements IUserInterface{
  final IUserRepository userRepository;

  GetUser({required this.userRepository});

  @override
  Future<TandizaClient?> getUser() async {
    // TODO: implement getUser
    await userRepository.getUser();
  }
}