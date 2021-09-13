# CHANGELOG

Em 22/05/2021, foram realizadas as modificações seguintes:

1. mudança do tipo da variável ``duracao-sessao``, de _number/default_ para _string/default_, no ``schema.json`` a ser empregada nos recursos a partir de março de 2021 (i.e. ``portal-paginas-destino-2021-03.csv`` e ``ckan-paginas-destino-2021-03.csv``);

2. em função dessa modificação, a versão do schema foi atualizada de v1 para v2, acarretando:

    2.1. realocação dos arquivos contendo schema.json e dialect.json em nova pasta 'schema';

    2.2. indicação da versão do schema (v1 ou v2) no respectivo valor desta propriedade no datapackage.json;

    2.3. indicação da versão do schema (v1 ou v2) nos arquivos dos recursos de março em diante;