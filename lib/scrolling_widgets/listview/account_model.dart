class Account {
  final int id;
  final String name;
  final String image;
  final String professional;

  Account({
    required this.id,
    required this.name,
    required this.image,
    required this.professional,
  });
}

List accountList = [
  Account(
      id: 1,
      name: "A",
      image: "images/place1.jpg",
      professional: "senior Java"),
  Account(
      id: 2,
      name: "B",
      image: "images/place1.jpg",
      professional: "senior Java"),
  Account(
      id: 3,
      name: "C",
      image: "images/place1.jpg",
      professional: "senior Java"),
  Account(
      id: 4,
      name: "D",
      image: "images/place1.jpg",
      professional: "senior Java"),
  Account(
      id: 5,
      name: "R",
      image: "images/place1.jpg",
      professional: "senior Java"),
  Account(
      id: 6,
      name: "E",
      image: "images/place1.jpg",
      professional: "senior Java"),
];
