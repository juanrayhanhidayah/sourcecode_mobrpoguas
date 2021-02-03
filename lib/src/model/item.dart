class Item {
  final String id, title, deskripsi, date;

  Item({
    this.id,
    this.title,
    this.deskripsi,
    this.date,
  });
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      title: json['title'],
      deskripsi: json['deskripsi'],
      date: json['date'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'deskripsi': deskripsi,
        'date': date,
      };
}
