
import 'package:booking/core/util/network/local/Cach_Helper.dart';
import 'package:booking/core/util/widget_functions.dart';
import 'package:booking/feature/login/presentation/login.dart';

String token = '';

List<String> homeImages = [
  'https://images.unsplash.com/photo-1623697443281-8ed5ddfee7c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
'https://images.unsplash.com/photo-1591448764624-d7973a442bff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
'https://images.unsplash.com/photo-1526893381913-e311045b8064?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'
];

void signOut(context){
  CacheHelper.removeData(key: 'token').then((value) {
    if (value){
      navigateAndFinish(context: context, widget: LoginScreen());
    }
  });
}