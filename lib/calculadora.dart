import 'package:math_expressions/math_expressions.dart';

String calcula(String valor) {
  int index = valor.length - 1;

  if(valor.contains("*", index) ||
      valor.contains("/", index)) {
    valor += '1';
  }
  if(valor.contains("-", index) ||
      valor.contains("+", index) ||
      valor.contains(".", index)) {
    valor += '0';
  }
    Parser p = Parser();
    Expression exp = p.parse(valor);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    String resultado = eval.toString();
    return resultado;
}


String inverte(String valor) {
  Parser p = Parser();
  Expression exp = p.parse(valor);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);
  eval = eval * (-1);
  String resultado = eval.toString();
  return resultado;
}

dynamic parenteses = 0;

String validaConta(String valor, String novoValor) {
  if (valor.length > 0) {
    int index = valor.length - 1;

    if (novoValor == "-" &&
        !valor.contains("-", index) &&
        !valor.contains(".", index)) {
      print("first");
      existePonto = false;
      return novoValor;
    }
    if (valor.contains("*", index) ||
        valor.contains("/", index) ||
        valor.contains("-", index) ||
        valor.contains("+", index) ||
        valor.contains(".", index)) {
      if ((novoValor != "*") &&
          (novoValor != "+") &&
          (novoValor != "-") &&
          (novoValor != "/") &&
          (novoValor != ".")
      ) {
        print("second");
        return novoValor;
      }
      print("three");
      return "";
    } else {
      if (novoValor == ".") {
        print("four");
        return validaPonto();
      } else {
        if(existePonto==true){
          if ((novoValor != "*") &&
              (novoValor != "+") &&
              (novoValor != "/") &&
              (novoValor != "-")
          ){
            print("nine");
            return novoValor;
          }
          print("five");
          existePonto = false;
          return novoValor;
        }
        print("six");
        return novoValor;
      }
    }
  } else {
    if ((novoValor != "*") &&
        (novoValor != "+") &&
        (novoValor != "/") &&
        (novoValor != ".")
    ){
      print("seven");
      return novoValor;
    }
    print("eigth");
    return "";
  }
}

bool existePonto = false;

String validaPonto() {
  if (existePonto == true) {
    print('ponto existente');
    return "";
  } else {
    existePonto = true;
    print('ponto criado');
    return ".";
  }
}
