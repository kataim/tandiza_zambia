class ClientFinancials {

final List result;
final String  clientId;
final String firstName;
  final String surname;
  final String nrcNumber;
  final String dateOfBirth;
  final List loans;
  final List applications;

  ClientFinancials({required this.result,
    required this.clientId, required this.firstName,
    required this.surname,required this.nrcNumber,
    required this.dateOfBirth,
    required this.loans,
    required this.applications});

Map<String, dynamic> toJson() => {
  "result": result,
   "clientId": clientId,
   "firstName": firstName,
   "surname": surname,
   "nrcNumber": nrcNumber,
   "dateOfBirth": dateOfBirth,
   "loans": loans,
   "applications": applications
  };

  /* static TandizaClient fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;

    return TandizaClient(
      result: snapshot["results"],
       clientId: snapshot["clientId"],
       firstName: snapshot["firstName"],
       surname: snapshot["surname"],
       nrcNumber: snapshot["nrcNumber"],
       dateOfBirth: snapshot["dateOfBirth"]
       applications: snapshot["applications"]
    );
  } */

}