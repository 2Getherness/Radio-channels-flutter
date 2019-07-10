class ParentClass {
  final String copyright;
  final List<Programs> programs;
  final String pagination;
  ParentClass({this.copyright, this.programs, this.pagination});
  factory ParentClass.fromJson(Map<String, dynamic> json) {
    return ParentClass(
      copyright: json['copyright'],
      // programs: Programs.fromJson(json['programs'])
      programs: parsePrograms(json),
    );
  }

  static parsePrograms(programsJson) {
    var list = programsJson["programs"] as List;
    List<Programs> programsList = list.map((data) => Programs.fromJson(data)).toList();
    for (var item in programsList) {
      // print("List: '$item['description']'");
      // print(item);
    }
    return programsList;
  }
}
class Programs1 {
  final String description;
  final String email;
  final String programimage;
  final int id;
  final String name;
  Programs1({
    this.id,
    this.name,
    this.description,
    this.email,
    this.programimage
    });
  factory Programs1.fromJson(Map<String, dynamic> json) {
   //print("Programs object: '$json'");
    return Programs1(
      description: json['description'],
      email: json['email'],
      programimage: json['programimage'], 
      id: json['id'] as int, 
      name: json['name'],
      );
  }
}







class Programs {
  final String description;
  final String email;
  final String programimage;
  final String broadcastinfo;
  final String phone;
  final String programurl;
  final String programimagetemplate;
  final String programimagewide;
  final String programimagetemplatewide;
  final String socialimage;
  final String socialimagetemplate;
  final List<Socialmediaplatforms> socialmediaplatforms;
  final Channel channel;
  final bool archived;
  final bool hasondemand;
  final bool haspod;
  final String responsibleeditor;
  final int id;
  final String name;
  Programs({
    this.broadcastinfo,
    this.phone,
    this.programurl,
    this.programimagetemplate,
    this.programimagewide,
    this.programimagetemplatewide,
    this.socialimage,
    this.socialimagetemplate,
    this.socialmediaplatforms,
    this.channel,
    this.archived,
    this.hasondemand,
    this.haspod,
    this.responsibleeditor,
    this.id,
    this.name,
    this.description,
    this.email,
    this.programimage});
  factory Programs.fromJson(Map<String, dynamic> json) {
    //print(json);
    var programs = Programs(
      description: json['description'],
      email: json['email'],
      programimage: json['programimage'],
      programurl: json['programurl'],
      phone: json['phone'],
      broadcastinfo: json['broadcastinfo'],
      programimagetemplate: json['programimagetemplate'], programimagewide: json['programimagewide'],
      programimagetemplatewide: json['programimagetemplatewide'],
      socialimage: json['programimagetemplatewide'], socialimagetemplate: json['socialimagetemplate'],
      socialmediaplatforms: parseSocialMedia(json),
      channel: Channel.fromJson(json['channel']), archived: json['archived'], hasondemand: json['hasondemand'],
      haspod: json['haspod'], responsibleeditor: json['responsibleeditor'], id: json['id'], name: json['name'],);
    for (var i = 0; i < json.length; i++) {
      print(json['programs']);
    }
    return programs;
  }

  static parseSocialMedia(programsJson) {
    var list = programsJson["socialmediaplatforms"] as List;
    List<Socialmediaplatforms> socialMediaList = list.map((data) => Socialmediaplatforms.fromJson(data)).toList();
    for (var item in socialMediaList) {
      // print("List: '$item['description']'");
      // print(item);
    }
    return socialMediaList;
  }
  // static List<Channel> parseChanel(programsJson) {
  //   print(programsJson);
  //   List<Channel> channelsList = new List<Channel>.from(programsJson);
  //   for (var item in channelsList) {
  //     // print("List: '$item['description']'");
  //     // print(item);
  //   }
  //   return channelsList;
  // }
}
class Socialmediaplatforms {
  final String platform;
  final String platformurl;
  Socialmediaplatforms({this.platform, this.platformurl});
  factory Socialmediaplatforms.fromJson(Map<String, dynamic> json) {
    return Socialmediaplatforms(
      platform: json['platform'],
      platformurl: json['platformurl']
    );
  }
}
class Channel {
  final String name;
  Channel({this.name});
  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      name: json['name']
    );
  }
}