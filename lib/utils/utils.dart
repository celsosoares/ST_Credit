class Utils{

  String getNameInitials(String name){
    RegExp regex = RegExp(r'\b\w');
    Iterable<Match> matches = regex.allMatches(name);
    StringBuffer initialsBuffer = StringBuffer();

    int count = 0;

    for(Match match in matches){
      if(count < 2){
        initialsBuffer.write(match.group(0));
        count ++;
      } else{
        break;
      }
    }

    String initials = initialsBuffer.toString().toUpperCase();
    return initials;
  }

  String getName(String name){
    RegExp regex = RegExp(r'\b\w+\b');
    Iterable<Match> matches = regex.allMatches(name);
    StringBuffer initialsBuffer = StringBuffer();

    int count = 0;

    for(Match match in matches){
      if(count < 2){
        initialsBuffer.write(match.group(0)!);
        if (count == 0) {
          initialsBuffer.write(' '); // Adiciona um espaço após a primeira palavra
        }
        count++;
      } else{
        break;
      }
    }

    String NameUser = initialsBuffer.toString();
    return NameUser;
  }

  String JoinNameAndSurname(String name, String surname){
    StringBuffer completeNameBuffer = StringBuffer();
    completeNameBuffer.write(name);
    completeNameBuffer.write(' ');
    completeNameBuffer.write(surname);
    String completeName = completeNameBuffer.toString();
    return completeName;
  }
}