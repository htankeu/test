class DoctorModel{
  final String name;
  final String position;
  final int averageReview;
  final int totalReviews;
  final String profile;

  DoctorModel({required this.name, required this.position, required this.averageReview, required this.totalReviews,required this.profile});
}


List<DoctorModel> nearbyDoctors =[
  DoctorModel(name: "Dr Jean Behebeck", position: "General Practitioner", averageReview: 3, totalReviews: 185, profile: "assets/images/doctor_3.png"),
  DoctorModel(name: "Dr Shaun", position: "General Practitioner", averageReview: 4, totalReviews: 195, profile: "assets/images/doctor_4.png"),
  DoctorModel(name: "Dr Murphy", position: "General Practitioner", averageReview: 2, totalReviews: 105, profile: "assets/images/doctor_5.png"),
  DoctorModel(name: "Dr Richard", position: "General Practitioner", averageReview: 5, totalReviews: 200, profile: "assets/images/doctor_1.png"),
];