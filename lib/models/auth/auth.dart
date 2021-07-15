class SignUpRequest {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? confirmPassword;
  String? phoneNumber;
  String? role;
  ClientRequest? clientRequest;
  GroupRequest? groupRequest;
  List<Link>? links;
  Location? location;
  ProfileRequest? profileRequest;
  List<Skill>? skills;

  SignUpRequest({
    this.skills,
    this.clientRequest,
    this.confirmPassword,
    this.email,
    this.firstName,
    this.groupRequest,
    this.lastName,
    this.links,
    this.location,
    this.password,
    this.phoneNumber,
    this.profileRequest,
    this.role = "ROLE_GROUP",
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    if (this.clientRequest != null) {
      data['clientRequest'] = this.clientRequest!.toJson();
    }
    data['confirmPassword'] = this.confirmPassword;
    data['email'] = this.email;
    data['firstname'] = this.firstName;
    if (this.groupRequest != null) {
      data['groupRequest'] = this.groupRequest!.toJson();
    }
    data['lastName'] = this.lastName;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['password'] = this.password;
    data['phoneNumber'] = this.phoneNumber;
    // if (this.profileRequest != null) {
    //   data['profileRequest'] = this.profileRequest!.toJson();
    // }
    data['role'] = this.role;
    if (this.skills != null) {
      data['skills'] = this.skills!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Location {
  String? aptSuite;
  String? city;
  String? state;
  String? streetAddress;
  String? zipCode;
  String? country;
  String? id;

  Location({
    this.country,
    this.aptSuite,
    this.city,
    this.state,
    this.streetAddress,
    this.zipCode,
    this.id,
  });

  Map<String, dynamic> toJson() {
    var data = Map<String, dynamic>();
    data["aptSuite"] = this.aptSuite;
    data["city"] = this.city;
    data["state"] = this.state;
    data["streetAddress"] = this.streetAddress;
    data["zipCode"] = this.zipCode;
    data["country"] = this.country;
    return data;
  }
}

class ProfileRequest {
  final String? profileType;
  final String? workTimeType;
  final String? proffestionId;
  final String? seniorotyId;

  ProfileRequest(
      {this.proffestionId,
      this.profileType,
      this.seniorotyId,
      this.workTimeType});

  Map<String, dynamic> toJson() {
    var data = Map<String, dynamic>();
    data["profileType"] = this.profileType;
    data["workTimeType"] = this.workTimeType;
    data["proffesionId"] = this.proffestionId;
    data["seniorotyId"] = this.seniorotyId;

    return data;
  }
}

class ClientRequest {
  String? clientType;
  String? companyName;
  String? yourPosition;
  String? id;

  ClientRequest(
      {this.clientType, this.companyName, this.yourPosition, this.id});

  Map<String, dynamic> toJson() {
    var data = Map<String, dynamic>();
    data["clientType"] = this.clientType;
    data["companyName"] = this.companyName;
    data["yourPosition"] = this.yourPosition;
    return data;
  }
}

class GroupRequest {
  String? groupType;
  String? id;

  GroupRequest({this.groupType, this.id});

  Map<String, dynamic> toJson() {
    var data = Map<String, dynamic>();
    data["groupType"] = this.groupType;
    data["id"] = this.id;
    return data;
  }
}

class Link {
  final String? name;
  Link({this.name});

  Map<String, dynamic> toJson() {
    var data = Map<String, dynamic>();
    data["name"] = this.name!;

    return data;
  }
}

class Skill {
  final String? name;

  Skill({this.name});
  Map<String, dynamic> toJson() {
    var data = Map<String, dynamic>();
    data["skill"] = this.name!;

    return data;
  }
}
