Nome do ficheiro:
    Nr_da_arvore - Nome_do_virus

Fazer include do novo ficheiro:
    +- Linhas 18-19

Acrescetar ficheiro a base_de_conhecimento:
    +- Linha 21

Acrescentar novas evidencias e hipoteses da nova arvore:
    Nas evidencias o segundo valor é o que querem usar nos testes
    +- Linhas 26 - 41

Acrescentar descricao do virus:
    (Nome do virus, Id)
    O Id é aquele que usam quando criam a conclusao (conclusao(Id, Probabilidade))
    +- Linha 43


Predicados importantes:
    run: Corre tudo direitinho desde o inicio
    arranca_motor: Pode ser necessário como explicado em baixo
    factos: Escreve os factos todos
    regras: Escreve as regras todas
    metaconhecimento: Escreve as evidencias/hipoteses, e as regras que cada uma delas pode disparar
    conclusoes: Escreve as conclusoes todas


O run não é perfeito porque existe um problema com o arranca_motor dos professores,
    por vezes é preciso correr o arranca_motor várias vezes até dar 'true'.

A razão de ele não funcionar é porque o sistema não tem em consideração
    os factos que são criados enquando o sistema corre. 
    Nao faco ideia porque é que isto acontece mas é o que é.

Não perdi tempo nenhum com o como nem whynot. 