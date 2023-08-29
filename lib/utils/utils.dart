
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
}