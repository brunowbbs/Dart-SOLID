//OCP nos informa que devemos ser capazes de extender um comportamento de classes,
//sem modifica-los

class Pagamento {
  void pagarBoleto() => print("Pagando boleto...");
  void pagarImposto() => print("Pagando imposto...");
}

/* 
  E se precisarmos adicionar um novo tipo de pagamento? Dessa forma, estamos sujeitos
  a modificar nosso codigo ja em produção.

  SOLUÇÃO:
  Devemos ser capazes de extender o funcionamento da nossa classe de Pagamento, ou seja
  "pagar" porem sem modificar a classe existente
*/

abstract class Pagamento2 {
  int valor = 20;
  void pagar();
}

//na herança, reutilizamos o valor
class PagamentoBoleto extends Pagamento2 {
  @override
  void pagar() => print("Pagando boleto...");
}

// na extensão re-implementamos o valor
class PagamentoImposto implements Pagamento2 {
  @override
  int valor = 10;

  @override
  void pagar() => print("Pagando imposto...");
}

//nova forma de pagamento
class PagamentoCartao extends Pagamento2 {
  @override
  void pagar() => print("Pagando cartão...");
}
