class EditHistory {
  EditHistory({
    this.editDetail,
    this.total,
  });

  List<EditDetail>? editDetail;
  int? total;

  factory EditHistory.fromJson(Map<String, dynamic> json) => EditHistory(
    editDetail: List<EditDetail>.from(json["edit_detail"].map((x) => EditDetail.fromJson(x))),
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "edit_detail": List<dynamic>.from(editDetail!.map((x) => x.toJson())),
    "total": total,
  };
}

class EditDetail {
  EditDetail({
    this.updateBy,
    this.totalQty,
    this.updateQty,
  });

  String? updateBy;
  int? totalQty;
  int? updateQty;

  factory EditDetail.fromJson(Map<String, dynamic> json) => EditDetail(
    updateBy: json["update_by"],
    totalQty: json["total_qty"],
    updateQty: json["update_qty"],
  );

  Map<String, dynamic> toJson() => {
    "update_by": updateBy,
    "total_qty": totalQty,
    "update_qty": updateQty,
  };
}
