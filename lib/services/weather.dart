class WeatherModel {
  String getImage(int condition) {
    if (condition < 300) {
      return 'https://static.vecteezy.com/system/resources/previews/001/307/578/non_2x/switzerland-on-a-stormy-day-free-photo.jpg';
    } else if (condition < 400) {
      return 'https://static.vecteezy.com/system/resources/previews/001/248/402/non_2x/empty-asphalt-road-free-photo.jpeg';
    } else if (condition < 600) {
      return 'https://static.vecteezy.com/system/resources/previews/001/271/773/non_2x/gray-road-between-green-trees-free-photo.jpeg';
    } else if (condition < 700) {
      return 'https://static.vecteezy.com/system/resources/previews/001/230/047/non_2x/snow-on-mountain-free-photo.jpeg';
    } else if (condition < 800) {
      return 'https://static.vecteezy.com/system/resources/previews/002/133/294/non_2x/tall-trees-on-a-mountain-free-photo.jpg';
    } else if (condition == 800) {
      return 'https://static.vecteezy.com/system/resources/previews/003/331/623/non_2x/borobudur-temple-from-the-side-with-a-clear-sky-free-photo.jpg';
    } else if (condition <= 804) {
      return 'https://static.vecteezy.com/system/resources/previews/001/849/833/non_2x/sunset-through-clouds-near-mountains-free-photo.jpeg';
    } else {
      return 'https://static.vecteezy.com/system/resources/previews/001/223/835/non_2x/moonrise-on-a-background-of-a-lonely-tree-free-photo.jpg';
    }
  }
}
