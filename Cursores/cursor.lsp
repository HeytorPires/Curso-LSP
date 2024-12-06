@ Definir Cursor Cur_nome;

@ Cur_Nome.SQL "<comando select>";
@ Cur_Nome.AbrirCursos();
@ Se (Cur_Nome.Achou)
@     inicio
@     <bloco de comando>
@     fim;

@ou 

@ Enquanto (Cur_Nome.Achou)
@     inicio
@     <bloco de comando>
@         Cur_Nome;Proximo();
@         Fim;

@ Cur_Nome.FecharCursor();
@Cursor Simples (utilizando valores fixos)
Definir Cursor Cur_R034FUN;
Definir Alfa aNomeFun;
Definir Data dDataAdm;
Definir Alfa aMensagem;
Definir Alfa aDatAdm;

aNomeFun = "";
dDataAdm = "";
aMensagem = "Não encontrou o Colaborador";

@Cursor@

Cur_R034FUN.SQL "Select NOMFUN, DATADM FROM \
                    WHERE NUMEMP =  \
                        AND TIPCOL = 1 \
                        AND NUMCAD = 1";

Cur_R034FUN.AbrirCuRSOR();
Se ( Cur_R034FUN.achou)
    inicio
        aNomeFun = Cur_R034FUN.NomFun;
        dDataAdm = Cur_R034FUN;
        ConverteMascara(3, dDataAdm, aDatAdm, "DD/MM/YYYY");
        aMensagem = "Colaborador: " + aNomeFun ", Data de Admissão: " + aDataAdm;
    Fim;

Cur_R034FUN.FecharCursor();

Mensagem(retorna, aMensagem); 