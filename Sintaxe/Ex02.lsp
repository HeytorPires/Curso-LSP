Definir Alfa aTexto;
Definir Alfa aNovoTexto;
Definir Alfa aTextoAux;

aTexto = "String que deve ser escrita de forma invertida!";
aNovoTexto = "";
aTextoAux = "";

Enquanto (aTexto <> "")
    Inicio
    aTextoAux = aTexto;
    TamanhoAlfa(aTextoAux, nTamanho); @ retorna o tamanho da String @ @
    CopiarAlfa(aTextoAux, nTamanho, 1); @ Copiar o ùltimo caractere @
    aNovoTexto = aNovoTexto + aTextoAux;
    aTextoAux = aTexto;
    DeletarAlfa(Alfa end Origim, Numero Pos, Numero Qtd);

    Fim;

mensagem(retorna, aTexto );