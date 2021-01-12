import 'package:indoindians/Blocs/Models/CustomAttributes.dart';
import 'package:indoindians/Blocs/Models/ExtensionAttributes.dart';
import 'package:indoindians/Blocs/Models/MediaGallery.dart';

class Product {
  final int id;
  final String sku;
  final String name;
  final int attribute_set_id;
  final int price;
  final int status;
  final int visibility;
  final String type_id;
  final String created_at;
  final String updated_at;
  final int weight;
  final ExtensionAttributes extensionAttributes;
  final List<MediaGallery> mediaGallery;
  final List<CustomAttributes> customAttributesList;
  Product({this.id , this.sku , this.name , this.attribute_set_id , this.price , this.status , this.visibility , this.type_id , this.created_at , this.updated_at , this.weight , this.extensionAttributes , this.mediaGallery , this.customAttributesList});
  factory Product.fromJson(Map<String , dynamic> json){
    return Product(
      id : json['id'] as int,
      sku : json['sku'] as String,
      name : json['name'] as String,
      attribute_set_id: json['attribute_set_id'] as int,
      price : json['price'] as int,
      status : json['status'] as int,
      visibility: json['visibility'] as int,
      type_id : json['type_id'] as String,
      created_at: json['created_at'] as String,
      updated_at : json['updated_at'] as String,
      weight : json['weight'] as int,
      extensionAttributes: json['extension_attributes'] as ExtensionAttributes,
      mediaGallery: json['media_gallery_entries'] as List<MediaGallery>,
      customAttributesList: json['custom_attributes'] as List<CustomAttributes>
    );
  }
}