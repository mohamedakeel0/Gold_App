








import 'package:gold_app/shared/network/local/cache_helper.dart';

import 'components.dart';

void signOut(context){
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) {

    }
  });
}


void printFullText(String text)
{
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
dynamic token=CacheHelper.getData(key: 'token');