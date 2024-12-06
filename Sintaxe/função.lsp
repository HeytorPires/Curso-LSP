Definir Alfa nResultado;
Definir funcao FSoma(Numero nValor1, Numero nValor2, Numero end nResultado);

nValor1 = 10;
nValor2 = 20;
FSoma(nValor1, nValor2, nResultado);
IntParaAlfa(nResultado, nResultado);
Mensagem(retorna, aResultado);

nValor1 = 100;
nValor2 = 100;
FSoma(nValor1, nValor2, aResultado);
IntParaAlfa(nResultado, aResultado);
Mensagem(retorna, nResultado);

funcao FSoma(Numero nV1, Numero nV2, Numero end nR);
    inicio
        nR = nV1 + nV2;
    fim;
