[![frictionless](https://github.com/dados-mg/google-analytics/actions/workflows/frictionless.yaml/badge.svg)](https://github.com/dados-mg/google-analytics/actions/workflows/frictionless.yaml)

# Relatórios Google Analytics Portal da Transparência e Dados Abertos(CKAN)

## Definição

Repositório de dataset que contém informações de referência das métricas de acesso do Google Analytics aos Portais de Transparência (PORTAL) e de Dados Abertos (CKAN), como:

1. Propriedade (portal ou ckan)

2. Mês

3. URL

4. Categorização das URLs acessadas segundo disposição hierárquica das consultas do Portal

5. Sessões

6. Usuários

7. Taxa de rejeição

8. Páginas por sessão

9. Duração média da sessão

O dataset é composto por um arquivo mensal contendo os dados das variáveis acima, para cada um dos portais de interesse, conforme nome do arquivo e primeira coluna (portal ou ckan).

A atualização é mensal, sendo a categorização das URLs é realizada pelo app em https://github.com/transparencia-mg/transparencia-google-analytics#readme, conforme heurística definida pela equipe DCTA.


## Orientações

Pré requisitos:
Python 3.9 instalado na máquina

#### 1- Clonando repositório

$ git clone https://github.com/dados-mg/google-analytics.git

#### 2- Criar e ativar ambiente (na pasta do projeto)

**Opção 1**
```
$ python3.9 -m venv venv
$ source venv/bin/activate
```
Caso a opção 1 apresente a mensagem de erro abaixo ir para a opção 2:
 ```
 /c/Users/name/AppData/Local/Microsoft/WindowsApps/python3.9: Permission denied
 ```
**Opção 2**
```
$ conda deactivate
$ source venv/Scripts/activate
```

Para saber se o ambiente está ativo a verificar se acima do caminho da pasta aparece a expressão `(venv)`.

#### 3- Instalando Frictionless (ter certeza que ambiente está ativado)

Caso já esteja instalado ir para o próximo passo.
```
$ pip install frictionless
```

#### 4- Validando conjunto

```
$ frictionless validate datapackage.json
```

# GLOSSÁRIO

* Hits: 

cada interação do usuário, incluindo (sem limitação) cada visualização de página, exibição de tela, evento ou transação de comércio eletrônico. Como resultado, uma única sessão pode resultar em muitos hits.

Toda e qualquer interação de um visitante com um site, começa com um hit. Sempre que um Visitante acessa alguma página com o Código de Acompanhamento instalado, um novo hit é recebido pelo Google Analytics.

Este hit carrega, dentre várias outras informações:

	IP;
	data e hora do hit;
	versão do navegador;
	**nome da página e URL**.

* Sessão:

conjunto de hits gerados por um visitante ao navegar. Quando o primeiro hit é gerado em uma página de destino, uma nova Sessão se inicia. E só acaba quando:

O visitante passa 30 minutos sem fazer nenhuma interação (nenhum novo hit);
Quando passa de meia-noite;
O usuário clique em alguma UTM (vamos explicar melhor a seguir);
O usuário navega entre diferentes subdomínios dentro de um mesmo site.

* Taxa de rejeição: 

sessão em que o usuário visitou apenas uma única página e saiu, sem interagir com nenhuma outra página.

* Canais

Saber se um usuário chegou até o seu site através da pesquisa orgânica do Google, digitando a URL diretamente no navegador ou clicando em um anúncio no Facebook, por exemplo, pode ser determinante para entender a sua presença digital.

O Google Analytics é um grande aliado nesta hora e consegue registrar facilmente as informações sobre o Canal de origem de determinado usuário. Os principais Canais observados nos relatórios são:

Direct: Quando a URL é acessada diretamente do navegador;
Organic Search: Google, Bing ou Yahoo!;
Social: Redes Sociais como o Instagram, Facebook ou LinkedIn;
Email: Newsletters, feed RSS;
Referral: Sites externos com links para o seu domínio;
Paid Search: Links Patrocinados do Adwords;
Display: Rede de Display do Adwords;
Others: Quando não pertence a nenhum dos outros canais padrão.

## Como as metas funcionam no Analytics

As metas do Analytics são configuradas no nível de Vista de Propriedade. Podem ser aplicadas a páginas ou telas específicas que seus usuários visitam, quantas páginas / telas visualizam em uma sessão, quanto tempo permanecem em seu site ou aplicativo e os eventos que acionam enquanto estão lá.

* Combinações dimensão/métrica válidas

Nem todas as métricas podem ser combinadas com todas as dimensões. Cada dimensão e métrica tem um escopo: nível do usuário, nível da sessão ou nível do hit. Na maioria dos casos, só é recomendado combinar dimensões e métricas que compartilham o mesmo escopo. Por exemplo, Sessões é uma métrica com base em sessões. Sendo assim, ela só pode ser usada com dimensões no nível da sessão, como Origem ou Cidade. Não seria lógico combinar Sessões com uma dimensão no nível do hit, como Página.

* Atribuição por solicitação

Esta atribuição fornece valores agregados para uma única métrica ou para um par de métrica/dimensão. Esse é o tipo mais comum e simples de atribuição do Google Analytics, pois os valores são determinados de solicitações GIF de usuários individuais. Desse modo, para qualquer solicitação, é possível procurar determinada dimensão e/ou métrica.

A maioria dos valores de dimensão está disponível no nível da solicitação. Para cada solicitação de página ou de evento feita no seu site, eles continuam persistentes tanto por meio da própria solicitação HTTP/GET quanto da solicitação GIF. Estas são algumas dimensões comuns disponíveis no nível da solicitação:

URI da página: disponível a cada solicitação do seu site, indica o caminho da página acessada

### [Metas para downloads](https://support.google.com/analytics/answer/6165470?hl=pt-BR)

Trate downloads de arquivos como uma conversão.
Este artigo aborda como acompanhar downloads como conversões de meta. Para fazer isso, primeiro você precisa configurar o link de download de uma dessas duas maneiras:

	como um evento

	como uma exibição virtual de página ou tela

__Se você configurar o link como uma exibição virtual de página ou tela, a contagem total de exibições de página ou tela do seu website ou aplicativo aumentará com o número de cliques nesse link__. Por esse motivo, recomendamos usar o Acompanhamento de eventos para configurar links de download.

Acompanhamento de downloads com uma meta de evento
Para acompanhar o link de download com uma meta de evento, primeiro configure o acompanhamento de eventos. Para detalhes sobre como configurar o acompanhamento de eventos, siga as instruções no guia do desenvolvedor do seu ambiente específico:

Acompanhamento do website: analytics.js
Aplicativos para dispositivos móveis: Android ou iOS.


[ID da meta e conjuntos de metas](https://support.google.com/analytics/answer/1012040#goal_types)
Cada meta que você cria recebe um ID numérico, que vai de 1 a 20. Elas são reunidas em grupos de até cinco metas individuais. Com esses grupos, você pode categorizar os diferentes tipos de objetivo do seu site. Por exemplo, é possível acompanhar downloads, registros e páginas de recibo em conjuntos de metas separados. Esses conjuntos são exibidos em muitos relatórios como links abaixo da guia Explorador.

### [Criar, editar e compartilhar metas](https://support.google.com/analytics/answer/1032415)

* [Exemplos de metas e casos de uso](https://support.google.com/analytics/topic/6150929)


### [er dados dos eventos em relatórios
Como os eventos são formados
Considerações de implementação
Práticas recomendadas para implementações de eventos
[Eventos x metas de eventos](https://support.google.com/analytics/answer/1033068)


## REFERÊNCIAS

https://support.google.com/analytics/answer/1070983?hl=pt-BR

https://rockcontent.com/blog/google-analytics/#instalar

https://support.google.com/analytics/answer/1033861?hl=pt-BR
