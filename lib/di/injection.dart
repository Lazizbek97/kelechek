import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:kelechek/di/injection.config.dart';

final locator = GetIt.instance;
 
@InjectableInit(  
  initializerName: 'init', // default  
  preferRelativeImports: true, // default  
  asExtension: true, // default  
)  
Future <void> configureDependencies() => locator.init();