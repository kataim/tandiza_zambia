import 'package:tandiza/domain/repository/user_repository_interface.dart';
import '../domain/models/tandiza_client_entity.dart';
import '../domain/usecases/user_application_interface.dart';

class GetUserFacade implements IUserInterface{
  final IUserRepository userRepository;

  GetUserFacade({required this.userRepository});

  @override
  Future<TandizaClient?> getUser() async {
    // TODO: implement getUser
    await userRepository.getUser();
  }
}