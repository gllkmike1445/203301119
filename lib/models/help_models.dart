class HelpModel {
  String? _name;
  String? _mail;
  String? _subject;
  String? _message;

  HelpModel({
    String? name,
    String? mail,
    String? subject,
    String? message,
  }) {
    if (name != null) {
      _name = name;
    }
    if (mail != null) {
      _mail = mail;
    }
    if (subject != null) {
      _subject = subject;
    }
    if (message != null) {
      _message = message;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get mail => _mail;
  set mail(String? mail) => _mail = mail;
  String? get subject => _subject;
  set subject(String? subject) => _subject = subject;
  String? get message => _message;
  set message(String? message) => _message = message;

  HelpModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _mail = json['mail'];
    _subject = json['subject'];
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = _name;
    data['mail'] = _mail;
    data['subject'] = _subject;
    data['message'] = _message;
    return data;
  }
}