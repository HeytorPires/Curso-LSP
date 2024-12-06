@===========================================================@
@ Cliente: Senior Sistemas @
@ Rotina: Cobrança Impostos em Pedidos de Venda @
@ Código da Regra: 25 @
@ Desenvolvedor: Instrutor GCS @
@ Data criação: 01/10/2009 @
@ Data última alteração: @
@ Histórico alteração: @
@===========================================================@
@Definição de variáveis@
Definir Alfa aDefineCobAliq;@ Indicativo carregado a partir do Serviço de Ped.Venda se haverá ou não Cob.Alíquota@
Definir Alfa VSCODSER; @ Variável de sistema do Código de Serviço @
Definir Numero VsNumPed; @ Variável de sistema de Numero do Pedido @
Definir Numero VSPreUni; @ Variável de sistema do Preço Unitário @
Definir Numero VSCODEMP; @ Variável de sistema do Código Empresa @
Definir Numero VsCodFil; @ Variável de sistema do Código Filial @
Definir Numero nPercAliq; @ Armazena percentual da alíquota carregado a partir da tabela USU_TAliCob @
INICIO
@Cursor para carregar o percentual da alíquota de cobrança.@
Definir Cursor Cur_PercAliq;
Cur_PercAliq.sql "SELECT USU_AliCob\
FROM USU_TAliCob\
WHERE USU_SeqTab = 1";
Cur_PercAliq.AbrirCursor();
nPercAliq = Cur_PercAliq.USU_AliCob; @Seta para a variável o valor de usu_AliCob carregado no Cursor@
Cur_PercAliq.FecharCursor();
@Cursor para verificar se o Pedido de Venda indica que haverá Cobrança da Alíquota (E120PED.USU_CCIPV = 'S') @
Definir Cursor Cur_PedidoServAliq; @Cursor para tratar quando no Pedido de Venda indica que haverá Cobrança CCI@
Cur_PedidoServAliq.sql "SELECT USU_CobAli\
                                FROM E120PED\
                            WHERE CodEmp =:VsCodEmp\
                                AND codfil =:VsCodFil\
                                AND numped =:VsNumPed\
                                AND Usu_CobAli = 'S'";
Cur_PedidoServAliq.AbrirCursor();
@Se o Pedido de Vendas está definido como cobrança de alíquota = 'N', encerra a regra@
Se (Cur_PedidoServAliq.NaoAchou)
Inicio
Cur_PedidoServAliq.FecharCursor();
VaPara Encerrar;
Fim;
@Se o Pedido de Vendas está definido como cobrança de alíquota = 'S', entra na rotina abaixo@
Se (Cur_PedidoServAliq.Achou)
Inicio
VsPreUni = VsPreUni + (VsPreUni*nPercAliq/100); @Aplica na variável de sistema de Preço Unitário do Serviço o fator da alíquota@
Cur_PedidoServAliq.FecharCursor();
Fim;
Encerrar: @Rotulo para encerrar a regra@
Cancel;
FIM