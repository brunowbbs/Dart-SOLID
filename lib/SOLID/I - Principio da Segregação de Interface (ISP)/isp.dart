//ISP => Muitas interfaces específicas são melhores que uma geral.

abstract class Conta {
  void depositar(int val);
  void transferir(int val);
  void realizarEmprestimo();
}

class ContaCorrente extends Conta {
  @override
  void depositar(int val) => print("Realizando...");

  @override
  void realizarEmprestimo() => print("Realizando...");

  @override
  void transferir(int val) => print("Realizando...");
}

class ContaPoupanca extends Conta {
  @override
  void depositar(int val) => print("Realizando...");

  @override
  void realizarEmprestimo() =>
      throw Exception("Conta poupança não faz emprestimo");

  @override
  void transferir(int val) =>
      throw Exception("Conta poupança não faz transferencia");
}

// O problema aqui é que estamos dependendo de Conta
// e conta nos oferece mais coisas do que realmente estamos utilizando

//SOLUÇÃO

abstract class Conta2 {
  void depositar(int val);
}

abstract class CestaDeServicos {
  void transferir(int valor);
  void realizarEmprestimo();
}

class ContaCorrente2 extends Conta2 implements CestaDeServicos {
  @override
  void depositar(int val) => "";

  @override
  void realizarEmprestimo() => "";

  @override
  void transferir(int valor) => "";
}

class ContaPoupanca2 extends Conta2 {
  @override
  void depositar(int val) => "";
}

class ContaConjunta extends Conta2 {
  @override
  void depositar(int val) => "";
}
