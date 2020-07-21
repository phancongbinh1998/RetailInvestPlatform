import 'package:retailinvestplatform/models/payment_account.dart';

class UserAccount{
  String username;
  String password;
  String fullName;
  String email;
  String phoneNumber;
  String createdDate;
  int role;
  String address;
  int paymentId;
  PaymentAccount paymentAccount;

  UserAccount(
      this.username,
      this.password,
      this.fullName,
      this.email,
      this.phoneNumber,
      this.createdDate,
      this.role,
      this.address,
      this.paymentId,
      this.paymentAccount);


}