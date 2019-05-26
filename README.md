# BDAD

### TO DO (3ª entrega)
- [X] Corrigir relatório
- [ ] 10 queries
    - [ ] descrição
    - [ ] sql
- [ ] 3 triggers
    - [ ] descrição
    - [ ] sql
- [ ] Adicionar dados à base de dados de modo às queries retornarem resultados apropriados


## Ideias de queries 
- [X] 1.  Lista de pessoas e numero de premios ganhos 
- [X] 2.  Atores que participaram em filmes realizados por uma dada pessoa 
- [x] 3.  Lista de filmes associados com o seu ator mais famoso (que participou em mais filmes)
- [x] 4.  País com mais primeiras estreias
- [x] 5.  Pessoas que tenha na watchlist a serie completa
- [x] 6.  filmes/atore/series que ganharam mais que dois premios no mesmo ano
- [x] 7.  todos os pares de pessoas que têm conteudos com participações da mesma pessoa na sua watchlist
- [x] 8.  Pessoas que participaram na saga Star Wars e ganharam premio por um filme que tenha uma categoria que não seja categoria de filmes da saga star wars
- [ ] 9.  Filme com mais lucro por ano 
- [ ] 10. pesooas que tem na sua watchlist todos os filmes de um determinado ator

- pesooas que tem na sua watchlist todos os filmes de um determinado ator
- todos os pares de pessoas que tem o mesmo filme na sua watchlist
- filmes que ganharam simultaneamente
- filmes com score > 8 q n ganharam premios
- 

## Ideias de triggers 
- [X] 1. Atualizar os scores quando se introduzem reviews
- [X] 2. impedir que sejam adicionadas pessoas que já morreram a filmes/series
- [ ] 3. impedir que sejam adicionados episodios a uma serie que já terminou
- outra ideia: impedir que pessoas ganhem prémios por filmes onde não participaram


## Operadores utilizados
- [x] 1. SFW
- [x] 2. DISTINCT
- [ ] 3. ORDER BY
- [x] 4. Like (pattern matching)
- [ ] 5. Arithmetic
- [x] 6. AS (renaming)
- [ ] 7. Set operators
    - [x] Union/Union All
    - [ ] Intersect
    - [x] Except
- [x] 8. Subquery in WHERE
- [ ] 9. Exists
- [ ] 10. All
- [ ] 11. Any
- [x] 12. In/not in
- [x] 13. Subquery in FROM
- [ ] 14. Subquery in SELECT
- [ ] 15. JOINS
    - [x] INNER JOIN
    - [x] NATURAL JOIN
    - [ ] LEFT/RIGHT/FULL OUTER JOIN
- [ ] 16. Aggregation
    - [x] min 
    - [x] max
    - [ ] sum 
    - [x] avg 
    - [x] count
- [x] 17. GROUP BY / HAVING


##### TO DO (outras entregas)
- [X] UML - Finalizar
- [X] Relatório - Adicionar novas partes
    - [X] Novo UML
    - [X] Discussão do novo UML
    - [X] Alterações ao modelo antigo
    - [X] Relações, CHAVES, modelo usado e dependências funcionais
    - [X] Falar sobre o SQL
- [X] SQL
    - [X] Criar as relações
    - [X] Adicionar restrições
    - [X] Expecificar as foreign keys da melhor forma possivel
    - [X] Adicionar ON UPDATE e ON DELETE clauses
    - [X] Criar o povoamento das tabelas

##### NOTAS:
- no uml atualizar a restrição de age rating DONE
- ver situação do year dos movies DONE
- restrição de onGoing (NULL) DONE
- dependencias funcionais (ver os uniques) DONE
- LEMBRAR QUE FALTA UM ON DELETE E ON UPDATE NA CLASSE TVSHOW DONE


