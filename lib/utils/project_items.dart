class ProjectModel {
  final String title;
  final String desciption;
  final List<String> images;
  final List<String> technologiesUsed;

  ProjectModel(
      {required this.title,
      required this.desciption,
      required this.images,
      required this.technologiesUsed});
}

String social = "assets/social";
String e_commerce = "assets/e-commerce";
List<String> socialMediaImages = [
  "$social/3.png",
  "$social/2.png",
  "$social/1.png",
  "$social/4.png",
  "$social/5.png",
  "$social/6.png",
  "$social/7.png",
  "$social/8.png",
  "$social/9.png",
  "$social/10.png",
  "$social/11.png",
];

List<String> eCommerceImages = [
  "$e_commerce/0.png",
  "$e_commerce/1.png",
  "$e_commerce/2.png",
  "$e_commerce/3.png",
  "$e_commerce/4.png",
  "$e_commerce/5.png",
  "$e_commerce/6.png",
  "$e_commerce/7.png",
  "$e_commerce/8.png",
];

List<ProjectModel> projects = [
  ProjectModel(
      title: "WaveConnect: Social Media Application",
      desciption: ''' 
   Introducing WaveConnect: your go-to social media platform built with Flutter, featuring Clean Architecture, Firebase for Backend, and Bloc for state management WaveConnect redefines social networking, offering a seamless and intuitive experience for users to share moments and connect with friends.
Users can share their cherished moments effortlessly by posting images directly from their device's gallery.
Users can easily save posts they wish to revisit.''',
      images: socialMediaImages,
      technologiesUsed: ["Flutter", "Dart", "Firebase", "BLoC"]),
  ProjectModel(
      title: "E-Commerce App",
      desciption: '''
 I've developed a fully functional E-commerce Application using Flutter. This app offers a seamless shopping experience where users can authenticate through various methods. They can browse a comprehensive list of products, add them to the cart, or save them for later using the wish list feature. They have the option to search for specific products or explore by category and brands, ensuring they find exactly what they're looking for.''',
      images: eCommerceImages,
      technologiesUsed: [
        'Flutter',
        'Dart',
        'Firebase',
        'SQFlite',
        'RiverPod',
      ])
];
