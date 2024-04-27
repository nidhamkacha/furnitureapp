class Notification {
  String? imgpath = '';
  String? title = '';
  String? desc = '';
  String? status = '';
  Notification({this.imgpath, this.title, this.desc, this.status});
}

List<Notification> notificationdata = [
  Notification(
      imgpath: 'assets/images/wooden_chair.png',
      title: 'Your order #123456789 has been shipped successfully',
      desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      status: 'New'),
  Notification(
      imgpath: 'assets/images/coffie_chair.png',
      title: 'Your order #123456789 has been shipped shipped',
      desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      status: 'New'),
  Notification(
      imgpath: 'assets/images/rest_chair.png',
      title: 'Your order #123456789 has been confirmed',
      desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      status: 'Hot'),
  Notification(
      imgpath: 'assets/images/soffaa.png',
      title: 'Discover hot sale furnitures this week.',
      desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      status: 'Hot'),
  Notification(
      imgpath: 'assets/images/drawer.png',
      title: 'Your order #123456789 has been canceled',
      desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      status: 'New'),
];
