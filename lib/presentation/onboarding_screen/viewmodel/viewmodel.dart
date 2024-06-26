import 'dart:async';

import 'package:zag_nights/presentation/base/base_cubit.dart';

class OnboadrdingViewModel extends BaseCubit implements OnboadrdingViewModelInput , OnboadrdingViewModelOutput{
 StreamController _streamController = StreamController<bool>();
  @override
  void start() {
    // TODO: implement start
    isValidPasswordInput.add('12345');
  }
  void dispose(){
    _streamController.close();
  }

  @override
  // TODO: implement isValidPasswordInput
  Sink get isValidPasswordInput => _streamController.sink;

  @override
  // TODO: implement isValidPasswordOutPut
  Stream<bool> get isValidPasswordOutPut => _streamController.stream.map((password) => isValid(password));


bool isValid(String password){
  if(password.length < 6)
    return false;
  else
    return true;
}


}

abstract class OnboadrdingViewModelInput{
  Sink get isValidPasswordInput;
}
abstract class OnboadrdingViewModelOutput{
  Stream<bool> get isValidPasswordOutPut;
}