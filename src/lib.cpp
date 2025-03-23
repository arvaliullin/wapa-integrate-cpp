extern "C" int factorial(int n) {

  int result = 1;

  if (n <= 1)
    return result;

  for (int i = 2; i <= n; i++) {
    result = result * i;
  }

  return result;
}

inline double f(double x) { return x * x; }

extern "C" double x2Integrate(double xmin, double xmax, int intervals_count) {
  double dx = (xmax - xmin) / intervals_count;
  double total = 0.0;
  double x = xmin;
  for (int i = 1; i < intervals_count; i++) {
    total = total + dx * (f(x) + f(x + dx)) / 2.0;
    x = x + dx;
  }
  return total;
}
