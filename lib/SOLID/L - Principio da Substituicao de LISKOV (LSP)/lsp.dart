// LSP => Os subtipos devem ser substituidos pelos seus tipos bases

/*
  A classe abstrata enumera características genéricas do modelo, mas não as implementa. 
  A classe abstrata obriga subclasses (folhas) a implementarem funcionalidades abstratas 
  previstas em seu corpo
*/

abstract class Conta {
  void depositar(int val) => print("Depositando...");
  void transferir(int val) => print("Transferindo...");
  void realizarEmprestimo() => print("Realizando emprestimo...");
}

class ContaCorrente implements Conta {
  @override
  void depositar(int val) => print("Depositando...");

  @override
  void realizarEmprestimo() => print("Transferindo...");
  @override
  void transferir(int val) => print("Realizando emprestimo...");
}

class ContaPoupanca implements Conta {
  @override
  void depositar(int val) => print("Depositando...");

  @override
  void realizarEmprestimo() =>
      throw Exception("Conta poupança não faz emprestimo");

  @override
  void transferir(int val) =>
      throw Exception("Conta poupança não faz transferencia");
}

main(List<String> args) {
  Conta c = ContaCorrente();
  c.realizarEmprestimo();

  c = ContaPoupanca();
  c.realizarEmprestimo(); //estourar uma exception
}
