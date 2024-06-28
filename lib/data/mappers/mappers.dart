// import 'package:zag_nights/app/constants.dart';
// import 'package:zag_nights/app/extensions.dart';
// import 'package:zag_nights/domain/models/model.dart';
//
// import '../response/responses.dart';
//
// extension CustomerResponseMapper on CustomerResponse? {
//   Customer toDomain() {
//     return Customer(
//         this?.id.orEmpty() ?? Constants.empty,
//         this?.name.orEmpty() ?? Constants.empty,
//         this?.numberOfNotification.orZero() ?? Constants.zero);
//   }
// }
//
// extension ContactsResponseMapper on ContactsResponse? {
//   Contact toDomain() {
//     return Contact(this?.phone.orEmpty() ?? Constants.empty,
//         this?.email.orEmpty() ?? Constants.empty);
//   }
// }
//
// extension AuthenticationResponseMapper on AuthenticationResponse? {
//   Authentication toDomain() {
//     return Authentication(this?.customer.toDomain(), this?.contacts.toDomain());
//   }
// }
