import 'dart:io';

class NewPostModel {
  String? category_id;
  String? title;
String? description;
String? contact_name;
String? city_id;
bool? accept_terms;
List<File>?  pictures;
String? country_code;
int? price;
String? email;

NewPostModel({
required this.email,
  this.category_id , this.title ,this.description ,this.contact_name ,this.city_id ,
  this.accept_terms ,this.pictures ,this.country_code ,this.price
});

Map<String,dynamic> toJson() {
   final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id']=category_id;
        data['title']=title;
    data['description']=description;
    data['contact_name']=contact_name;
    data['city_id']=city_id;
    data['accept_terms']=accept_terms;
    data['pictures']=pictures;
    data['price']=price;

    return data;
}




}