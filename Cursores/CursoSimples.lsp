@Cursor Simples (utilizando valores fixos)

Definir Cursor Cur_R034FUN;
Definir Alfa aNomeFun;
Definir Data dDataAdm;
Definir Alfa aMensagem;
Definir Alfa aDatAdm;

aNomeFun = "";
dDataAdm = "";
aMensagem = "Não encontrou o Colaborador";

NUMEMP = 1;
TIPCOL = 1;
NUMCAD = 1

@Cursor@

Cur_R034FUN.SQL "Select NOMFUN, DATADM FROM \
                    WHERE NUMEMP = :NUMEMP \
                        AND TIPCOL = :TIPCOL \
                        AND NUMCAD = :NUMCAD";

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