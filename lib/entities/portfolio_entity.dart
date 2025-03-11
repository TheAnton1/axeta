import 'package:copy_with_extension/copy_with_extension.dart';

part 'portfolio_entity.g.dart';

@CopyWith()
class PortfolioEntity {
  PortfolioEntity({this.urls});

  final Map<String, String>? urls;
}
