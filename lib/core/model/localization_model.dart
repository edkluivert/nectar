
class Localization {
  final List <Locals> locals;
  final List <States> states;

  Localization({required this.locals, required this.states});

  factory Localization.fromJson(Map<String, dynamic> json) {
    return Localization(
 
       
      states: parseStates(json),
      locals: parseLocals(json),
      
    );
  }

  
  static List<States> parseStates(statesJson) {
    var slist = statesJson['states'] as List;
    List<States> statesList =
       slist.map((data) => States.fromJson(data)).toList();
    return statesList;
  }

  static List<Locals> parseLocals(localsJson) {
    var plist = localsJson['locals'] as List;
    List<Locals> localsList =
        plist.map((data) => Locals.fromJson(data)).toList();
    return localsList;
  }



}

class States {
  final int id;
  final String name;

  States({required this.id, required this.name});

  factory States.fromJson(Map<String, dynamic> parsedJson){
    return States(id: parsedJson['id'], name: parsedJson['name']);
  }

}

class Locals {
  final int id;
  final String name;
  final int stateId;

  Locals({required this.id, required this.name, required this.stateId});

  factory Locals.fromJson(Map<String, dynamic> parsedJson) {
    return Locals(id: parsedJson['id'], name: parsedJson['name'],  stateId: parsedJson['state_id']);
  }

}