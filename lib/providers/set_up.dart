import 'package:drohealth_assessment/providers/bag_provider.dart';
import 'package:drohealth_assessment/services/mock_data.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders,
];

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: MockData()),
];

List<SingleChildCloneableWidget> dependentServices = [
  ChangeNotifierProvider.value(value: BagProvider()),
];

List<SingleChildCloneableWidget> uiConsumableProviders = [];
