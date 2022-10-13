// class MapItems {
//   List<FetchItems>? fetchItems;
//
//   MapItems({this.fetchItems});
//
//   MapItems.fromJson(Map<String, dynamic> json) {
//     if (json['fetchItems'] != null) {
//       fetchItems = <FetchItems>[];
//       json['fetchItems'].forEach((v) {
//         fetchItems!.add(new FetchItems.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.fetchItems != null) {
//       data['fetchItems'] = this.fetchItems!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class FetchItems {
//   String? sId;
//   String? itemName;
//   String? manufacturerCompany;
//   int? quantityAvailable;
//   String? expiryDate;
//   String? createdAt;
//   String? updatedAt;
//   int? iV;
//   String? name;
//
//   FetchItems(
//       {this.sId,
//         this.itemName,
//         this.manufacturerCompany,
//         this.quantityAvailable,
//         this.expiryDate,
//         this.createdAt,
//         this.updatedAt,
//         this.iV,
//         this.name});
//
//   FetchItems.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     itemName = json['itemName'];
//     manufacturerCompany = json['manufacturerCompany'];
//     quantityAvailable = json['quantityAvailable'];
//     expiryDate = json['expiryDate'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['itemName'] = this.itemName;
//     data['manufacturerCompany'] = this.manufacturerCompany;
//     data['quantityAvailable'] = this.quantityAvailable;
//     data['expiryDate'] = this.expiryDate;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['__v'] = this.iV;
//     data['name'] = this.name;
//     return data;
//   }
// }
