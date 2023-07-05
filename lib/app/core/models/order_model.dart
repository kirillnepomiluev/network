import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/app/core/models/clothe_model.dart';
import 'package:network_app/utils/utils.dart';

class OrderModel {
  final int? id;
  final String hash;
  final String status;
  final bool? success;
  final String? userID;
  final int? clotheID;
  final DateTime? createdDate;
  final double? price;
  final ClotheModel clotheModel;

  OrderModel(
      {this.id,
      this.userID,
      this.clotheID,
      this.createdDate,
      this.hash = '',
      this.status = '',
      this.success,
      this.price,
      required this.clotheModel,
      });

  factory OrderModel.fromMap(Map<String, dynamic> dataMap) {
    DateTime createdDate = Utils.getDate(dataMap['created_date'])!;

    return OrderModel(
      id: dataMap['id'],
      userID: dataMap['user_id'],
      clotheID: dataMap['clothe_id'],
      createdDate: createdDate,
      hash: dataMap['hash'],
      price: dataMap['price'],
      status: dataMap['status'],
      success: dataMap['success'],
      clotheModel: ClotheModel()
    );
  }

  factory OrderModel.emptyModel() {
    return OrderModel(clotheModel: ClotheModel.emptyModel());
  }


  static Future<OrderModel> create(Map<String, dynamic> dataMap) async {
    DateTime createdDate = Utils.getDate(dataMap['created_date'])!;

    final clotheID = dataMap['clothe_id'];
    final clothesList = await AppSupabase.getData(id: clotheID, collRef: AppSupabase.strClothes);
    if (clothesList == null || clothesList.isEmpty) {
      return OrderModel.emptyModel();
    }
    final clotheMap = clothesList.first;
    final clotheModel = ClotheModel.fromMap(clotheMap);

    return OrderModel(
      id: dataMap['id'],
      userID: dataMap['user_id'],
      clotheID: dataMap['clothe_id'],
      createdDate: createdDate,
      hash: dataMap['hash'],
      price: dataMap['price'],
      status: dataMap['status'],
      success: dataMap['success'],
      clotheModel: clotheModel
    );
  }
}
