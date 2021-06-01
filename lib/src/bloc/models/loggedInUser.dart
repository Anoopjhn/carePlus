
import 'package:firebase_auth/firebase_auth.dart';

class LoggedInUser {
  String about_me;
  String email;
  bool enable_booking;
  String gender;
  bool include_in_result;
  String inspirations;
  bool is_artist;
  bool is_normal_user;
  bool isMessage;
  String  name;
  List<dynamic> availableDates = [];
  dynamic skills;
  String uid;
  User user;
  String profile;
  String location;
  int selectedCity;
  String selectedCityName;

  LoggedInUser({this.about_me,this.location,this.availableDates,this.isMessage,this.selectedCity,this.selectedCityName,this.profile,this.email, this.enable_booking, this.gender, this.include_in_result, this.inspirations, this.is_artist, this.is_normal_user, this.name, this.skills, this.uid});

  factory LoggedInUser.fromJson(Map<String, dynamic> json) {
    try{


      return LoggedInUser(
        about_me: json['about_me'] != null ?json['about_me'] : null,
        email: json['email'],
        enable_booking: json['enable_booking'],
        gender: json['gender'],
        profile: json['profile'],
        include_in_result: json['include_in_result'],
        inspirations: json['inspirations'] != null ? json['inspirations'] : null,
        is_artist: json['is_artist'],
        isMessage: json['is_message']!=null?json['is_message']:true,
        is_normal_user: json['is_normal_user'],
        name: json['name'] != null ? json['name'] : null,
        skills: json['skills'] != null ? json['skills'] : null,
        uid: json['uid'],
        availableDates: json['available_dates']!=null?json['available_dates']:[],
        selectedCity: json['city'],
        selectedCityName: json['city_name'],
        location: json['location']!=null?json['location']['place']!=null?json['location']['place']:null:null,
      );
    }catch(ex){
      print(ex);
      return null;
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['enable_booking'] = this.enable_booking;
    data['gender'] = this.gender;
    data['include_in_result'] = this.include_in_result;
    data['is_artist'] = true;
    data['is_message'] = this.isMessage!=null? this.isMessage:true;
    data['is_normal_user'] = this.is_normal_user;
    data['uid'] = this.uid;
    if(this.skills == null || this.skills.length==0){
      this.skills = [1];
    }
    data['city'] = this.selectedCity!=null?this.selectedCity:1;
    if (this.about_me != null) {
      data['about_me'] = this.about_me;
    }
    if (this.availableDates != null) {
      data['available_dates'] = this.availableDates;
    }
    if(this.location != null){
      data['location'] = {"place":"Sample"};
    }
    if (this.inspirations != null) {
      data['inspirations'] = this.inspirations;
    }
    if (this.name != null) {
      data['name'] = this.name;
    }
    return data;
  }


  int getEventId(String key) {
    if(key=="SESSION"){
      return 1;
    }else if(key=="PROJECT"){
      return 2;
    }else{
      return 3;
    }
  }

}