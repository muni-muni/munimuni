
class Task {
// Class properties
  Int _id;
  String _name;
  bool _completed;
  // Default constructor
  Task(this._name);
  // Getter and setter for id getId() => this._id;
  setId(id) => this._id = id;
  // Getter and setter for name
  getName() => this._name;
  setName(name) => this._name = name;
  // Getter and setter for completed
  isCompleted() => this._completed;
  setCompleted(completed) => this._completed = completed;
}