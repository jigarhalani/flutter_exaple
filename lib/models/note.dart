class Note {
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;

  Note(this._title, this._date, this._priority, [this._description]);

  Note.withId(this._id, this._title, this._date, this._priority,
      [this._description]);

  int get id => _id;

  int get priority => _priority;

  String get title => _title;

  String get date => _date;

  String get description => _description;

  set title(String newTitle) {
    if (newTitle.length < 255) {
      this._title = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.length < 255) {
      this._description = newDescription;
    }
  }

  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 2) {
      this._priority = newPriority;
    }
  }

  set date(String newDate) {
    this._date = newDate;
  }

  // converting note object to map object

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if(_id != null){
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map['priority'] = _priority;
    map['date'] = _date;

    return map;
  }

  // extract node object from map object

  Note.fromMapObject(Map<String,dynamic> map){

    this._id=map['id'];
    this._date=map['date'];
    this._description=map['description'];
    this._title=map['title'];
    this._priority=map['priority'];

  }
}
