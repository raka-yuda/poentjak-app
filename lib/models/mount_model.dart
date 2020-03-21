class MountModel {
  final int id;
  final String link;
  final String mtName;
  final String mtLocation;
  final String mtDistance;
  // final String imgAuthor;
  // final String postDate;
  MountModel(
    this.id,
    this.link,
    this.mtName,
    this.mtLocation,
    this.mtDistance,
  );
}

List<MountModel> mountList = [
  MountModel(
    1,
    "https://images.pexels.com/photos/3380999/pexels-photo-3380999.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Mount Fuji",
    "Japan",
    "300 Miles",
  ),
  MountModel(
    2,
    "https://images.pexels.com/photos/3380999/pexels-photo-3380999.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Mount Jayawijaya",
    "Papua",
    "200 Miles",
  ),
  MountModel(
    3,
    "https://images.pexels.com/photos/3380999/pexels-photo-3380999.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Mount Prau",
    "Central Java",
    "100 Miles",
  ),
  MountModel(
    4,
    "https://images.pexels.com/photos/3380999/pexels-photo-3380999.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Mount Fuji",
    "Japan",
    "300 Miles",
  ),
  MountModel(
    5,
    "https://images.pexels.com/photos/3380999/pexels-photo-3380999.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "Mount Fuji",
    "Japan",
    "300 Miles",
  ),
];
