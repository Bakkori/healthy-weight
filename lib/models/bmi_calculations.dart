class BMICalculations {
  final double height;
  final double weight;

  BMICalculations({required this.height, required this.weight});

  double getHeight() {
    // return height in meter
    return height / 100;
  }

  double getWeight() {
    return weight;
  }

  getBMI() {
    return weight / (getHeight() * getHeight());
  }

  getBestWeight() {
    return 21.25 * (getHeight() * getHeight());
  }

  getBestMinWeight() {
    return 18.50 * (getHeight() * getHeight());
  }

  getBestMaxWeight() {
    return 24 * (getHeight() * getHeight());
  }
}
