class NewsModel {
  final int id;
  final String link;
  final String article;
  NewsModel(this.id, this.link, this.article);
}

List<NewsModel> newslist = [
  NewsModel(
      1,
      "https://images.pexels.com/photos/1169754/pexels-photo-1169754.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
      "Astronomers predict that our Milky Way galaxy is on a collision course with Andromeda, and we’ve got just a few billion years to brace for impact. However, the Milky Way might have a history of smashing up other galaxies. A new analysis suggests that our galaxy may have collided with a recently discovered dwarf galaxy called Antlia 2."),
  NewsModel(
      2,
      "https://images.pexels.com/photos/2538107/pexels-photo-2538107.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
      "Scientists discovered Antlia 2 in late 2018 in orbit of the Milky Way. It’s an unusual object due to its extremely low density. While it’s about the same size as the Large Magellanic Cloud satellite galaxy, it’s about 10,000 times more diffuse. According to the team from the Rochester Institute of Technology, the current state of Antlia 2 and perplexing ripples in the Milky Way’s hydrogen gas disk (discovered about ten years ago) could be explained by a collision between the two galaxies. Of course, Antlia 2 came out of it much worse off than the Milky Way."),
  NewsModel(
      3,
      "https://images.pexels.com/photos/912469/pexels-photo-912469.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
      "We often think of galaxies as dense, unified objects with wall-to-wall stars. However, galaxies are mostly empty space. When they “collide,” it’s unlikely that any two stars will actually run into each other. Instead, the gravitational interaction may fling stars out into deep space or cause them to migrate from one galaxy to the other. Clouds of dust and gas may also merge, causing an uptick in star formation.")
];
