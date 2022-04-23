/* 
  Uma classe deve ter apenas um motivo para mudar
  Sua responsabilidade é sempre encima de um e apenas um ator
*/

class ContaCorrente {
  validarContaExistente() {
    //logica crucial de negocio
  }

  //A classe conta corrente não deve conhecer as implementações do BD.
  salvarModificacoes() {
    print('Salvando no banco de dados...');
  }
}

/*
  Solução: Devemos separar cada responsabilidade para sua regra de negocio crucial,
  um objeto não pode e não deve fazer mais do que é o domínio dele.
*/

//Classe exclusiva para salvar no banco de dados.
class ContaCorrenteRepository {
  void save() => print("Salvando no banco de dados");
}

//Agora a conta corrente não conhece mais o banco de dados, ela somente
// sabe que existe um respositório que faz isso.
class ContaCorrente2 {
  final ContaCorrenteRepository _repository = ContaCorrenteRepository();

  validarContaExistente() {}

  void salvarModificacoes() {
    _repository.save();
  }
}

// POREEEEEM, estamos ferindo outros princípios.