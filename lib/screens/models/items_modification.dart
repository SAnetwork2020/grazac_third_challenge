class ItemsForListing {
  final String
      name,
      manufacturerCompany,
      expiryDate,
      createdAt,
      itemName,
      updatedAt;
  final int v, quantityAvailable;

  ItemsForListing(
      {required this.name,
      required this.manufacturerCompany,
      required this.expiryDate,
      required this.quantityAvailable,
      required this.v,
      required this.createdAt,
      required this.itemName,
      required this.updatedAt
      });

  factory ItemsForListing.fromJson(Map<String, dynamic> fetchItems) {
    return ItemsForListing(
      name: fetchItems["name"],
      manufacturerCompany: fetchItems["manufacturerCompany"],
      expiryDate: fetchItems["expiryDate"],
      quantityAvailable: fetchItems["quantityAvailable"],
      v: fetchItems["__v"],
      createdAt: fetchItems["createdAt"],
      itemName: fetchItems["itemName"],
      updatedAt: fetchItems["updatedAt"],
    );
  }

  // Map<String,dynamic> toJson(){
  //   final Map<String,dynamic> data = <String, dynamic>{};
  //   data["email"] = email;
  //   data["password"] = password;
  //   return data;
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['manufacturerCompany'] = manufacturerCompany;
    data['quantityAvailable'] = quantityAvailable;
    data['expiryDate'] = expiryDate;
    data['__v'] = v;
    data['createdAt'] = createdAt;
    data['itemName'] = itemName;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
