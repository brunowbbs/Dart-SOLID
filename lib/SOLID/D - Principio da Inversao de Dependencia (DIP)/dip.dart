//DIP => Depender de abstrações e não de classes concretas

class PagamentoRepository {
  void save() => print("Pagando...");
}

class ContaCorrente {
  PagamentoRepository _repository;

  ContaCorrente() {
    _repository = PagamentoRepository();
  }

  void executarAlgumaLogica() {
    _repository.save();
  }
}

/*
  A violação ocorre na linha 11, pois estamos dependendo de uma classe concreta.
  se quisermos fazer o mock por exemplo do repositorio não é possível.

  SOLUÇÃO: Vamos inverter a responsabilidade, deixar que quem chamar, resolva a dependecia do repositorio
*/

abstract class IPagamentoRepository {
  void save();
}

class PagamentoRepositoryImp implements IPagamentoRepository {
  @override
  void save() => print("implementação");
}

class PagamentoRepositoryMock implements IPagamentoRepository {
  @override
  void save() => print('mock');
}

class ContaCorrente2 {
  IPagamentoRepository _repository;

  ContaCorrente2(IPagamentoRepository repository) {
    _repository = repository;
  }

  void executaAlgumaLogica() {
    _repository.save();
  }
}

main(List<String> args) {
  ContaCorrente2 c = ContaCorrente2(PagamentoRepositoryImp());
  c.executaAlgumaLogica();

  c = ContaCorrente2(PagamentoRepositoryMock());
  c.executaAlgumaLogica();
}
