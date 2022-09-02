class DropDownVo {

  String? title;
  String? id;

  DropDownVo({ this.title,this.id});

  @override
  bool operator ==(Object other) => other is DropDownVo && other.id == id;

  @override
  int get hashCode => id.hashCode;
}