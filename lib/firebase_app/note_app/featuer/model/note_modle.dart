class Note {
  late String _title;
  late String _description;
  late List<Map> noteStats;

  String get title => this._title;

  set title(String value) => this._title = value;

  String get description => this._description;

  set description(String value) => this._description = value;


  Note.fromColoction ()
}
