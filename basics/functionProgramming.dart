// 1
class WannabeFunction {
  call(String a, String b, String c) => '$a $b $c!';
}

// 2
String scream(int length) => "A${'a' * length}h!";

main() {
  // 1
  var wf = new WannabeFunction();
  var out = wf("Hi","there,","gang");
  print('$out');

  // 2
  final values = [1, 2, 3, 5, 10, 50];
  // Imperative code
  // for (var length in values) {
    // print(scream(length));
  // }

  // Functional code
  // values.map(scream).forEach(print);

  // Functional Iterabel code
  values.skip(1).take(3).map(scream).forEach(print);

}