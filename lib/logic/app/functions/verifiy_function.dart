class VerifyFunction{

  static isFullForm( Map<String,dynamic> data ){
    List<bool> dataForms = [];

    data.forEach((key, value) {

      if( dataForms.toString() != "" && value.toString() != "null" )
        dataForms.add(true);
      else
        dataForms.add(false);

    });
    print(dataForms);
    return _isTrueData(dataForms);
  }

  static bool _isTrueData(List<bool> element){
    if(element.contains(false)){
      return false;
    }
    return true;
  }

}