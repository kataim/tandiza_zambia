class TandizaClient {
 final String clientId;
  final String firstName;
  final String surname;
  final String nrcNumber;
  final String dateOfBirth;

  TandizaClient({ required this.clientId, required this.firstName, required this.surname,required this.nrcNumber, required this.dateOfBirth});

  Map<String, dynamic> toJson() => {
   "clientId": clientId,
   "firstName": firstName,
   "surname": surname,
   "nrcNumber": nrcNumber,
   "dateOfBirth": dateOfBirth,
  };

  /* static TandizaClient fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;

    return TandizaClient(
       clientId: snapshot["clientId"],
       firstName: snapshot["firstName"],
       surname: snapshot["surname"],
       nrcNumber: snapshot["nrcNumber"],
       dateOfBirth: snapshot["dateOfBirth"]
    );
  } */
}