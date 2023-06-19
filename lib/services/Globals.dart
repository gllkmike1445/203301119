library chat_by_me.globals;

import 'auth.dart';

var user;
var name = "";
var phone = "";
var email = "";


void fetchInfo() {
  Auth().getUser().then((value) => {
    user = value,
    name = value.name,
    phone = value.phone,
    email = value.email
  });

}