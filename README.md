# bloc_add_sync

Repositório dedicado a resolver problemas de orquestramento de BLoCs.

## Qual é o problema?
Supondo que, para uma única página, criamos dois BLoCs para cuidar da sua lógica. Nesse pequeno exemplo, não haveria necessidade de dividir a lógica em mais de um BLoC, mas aqui, para fins de exercício simulamos uma situação em que uma página tenha tanta responsabilidade que faça sentido criar mais de um BLoC para ela.

No exemplo, criamos um app que exibe itens do menu de uma loja de derivados de frutas dinamicamente. Nesse caso específico, ocorreu algum erro ao trazer os itens da fonte de dados que não foi possível carregar as seções do cardápio: a seção de sucos e de sorvete. Cada seção, carregada por seu BLoC.

Nessa situação, queremos solucionar o seguinte problema: como fazemos com que um toast seja exibido dizendo que não há itens no cardápio quando nenhuma das duas seções tem itens?
