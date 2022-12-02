enum LottieAnimation {
  dataNotFound(name: 'data_not_found'),
  empty(name: 'data_not_found'),
  loading(name: 'loading'),
  error(name: 'data_not_found'),
  smallError(name: 'small_error');

  final String name;
  const LottieAnimation({required this.name});
}
 