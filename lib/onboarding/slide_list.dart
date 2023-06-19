class Slide {
  String title;
  String description;
  String image;

  Slide({required this.title, required this.description, required this.image});
}

final slideList = [
  Slide(
      title: "Live Tracking",
      description: "See all the analytics of Your clients.",
      image: "images/slider1.png"),
  Slide(
      title: "On-Time Delivery",
      description: "Manage your sales with Leading app.",
      image: "images/slider2.png"),

  Slide(
      title: "Professional Hands",
      description:
      "All of your data will be secure with us.",
      image: "images/slider3.png"),

];