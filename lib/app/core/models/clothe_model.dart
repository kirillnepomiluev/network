
class ClotheModel {

  final String title;
  final String type;
  final double price;
  final int? id;
  final int level;
  final int tokens;
  final String imageUrl;
  // final String rank;
  final bool rare;
  // final String rank;

  ClotheModel({
    this.id,
    this.title = '',
    this.price=100,
    this.type='',
    this.level=0,
    this.tokens=0,
    this.imageUrl='',
    this.rare=false,
  });

  factory ClotheModel.emptyModel() {
    return ClotheModel();
  }

  factory ClotheModel.fromMap(Map<String, dynamic> dataMap) {
    // final String rank = dataMap['rank'] == 'usual' ? 'Обычный' : 'Редкий';
    final cost = dataMap['price'].toDouble();

    return ClotheModel(
      // title: dataMap['title'],
      // type: dataMap['type'],
      // rank: dataMap['rank'],
      // level: dataMap['level'],
      // points: dataMap['points'],
      // imageUrl: dataMap['imageUrl']
      title: dataMap['title'] ?? '',
      type: dataMap['type'] ?? '',
      // rank: rank,
      rare: dataMap['rare'],
      level: dataMap['level'] ?? 1,
      tokens: dataMap['tokens'] ?? 0,
      price: cost,
      imageUrl: dataMap['image_url'] ?? '',
      id: dataMap['id'],
    );
  }


}