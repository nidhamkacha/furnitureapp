class Profile {
  String? title = '';
  String? subtitle = '';
  

  Profile({this.title, this.subtitle});
}

List<Profile> profiledata = [
  Profile(title: 'My orders', subtitle: 'Already have 10 orders'),
  Profile(title: 'Shipping Addresses', subtitle: '03 Addresses'),
  Profile(title: 'Payment Method', subtitle: 'You have 2 cards'),
  Profile(title: 'My reviews', subtitle: 'Reviews for 5 items'),
  Profile(title: 'Setting', subtitle: 'Notification, Password, FAQ, Contact'),
];
