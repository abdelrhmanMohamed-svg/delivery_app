class AddressModel {
  final String city;
  final String street;

  AddressModel({required this.city, required this.street});
}

List<AddressModel> dummyAddresses = [
  AddressModel(city: 'Mi casa', street: 'Direción de ejem'),
  AddressModel(city: 'Mi Trabajo', street: 'Direción de ejem'),
];
