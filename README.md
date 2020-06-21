![](https://i.imgur.com/9GVyOgQ.png)

# Mind

Mind (do inglês, cuidar) é uma **aplicação web** com adaptação para PWA (Progressive Web App) que permite que qualquer pessoa possa encontrar uma unidade de saúde ideal e mais próxima para ser atendido.

## Tecnologias

* [Ruby 2.6.5](https://www.ruby-lang.org/pt/)
* [Rails 6.0.3](https://rubyonrails.org/)
* [PostgreSQL](https://www.postgresql.org/)
* [Yarn](https://yarnpkg.com/)

## Iniciando o projeto

### Instalação local

1. O projeto tem como base principal o Ruby on Rails. Para fazer a instalação, você pode utilizar o seguinte guia: https://gorails.com/setup/ubuntu/20.04
(Atenção: no tutorial, use o rbenv! Nele aparece a versão do Ruby 2.6.6, onde estiver isso, troque para 2.6.5).

2. Faça o clone do repositório

3. Execute os comandos:
```
  gem install bundler:2.1.2
  bundle install
  bundle exec rails db:create db:migrate
  yarn
```

4. Por fim, para levantar o servidor: `bundle exec rails c` e visite http://localhost:3000.


Ele deve baixar todas as dependências do projeto (gems e módulos do node) e ter criado o banco de dados com sucesso.

Caso queira, inicialmente, popular o banco de dados, rode `rails db:seed`.

### Docker

1. Para usar o projeto com docker, dê checkout na branch dockerize (`git checkout dockerize`)

2. Execute os seguintes comandos:
```bash
docker-compose build

docker-compose run app \
bundle install && \
yarn install
docker-compose run app bundle exec rails db:create db:migrate db:seed

```
3. Levante o sercidor com `docker-compose up` e visite http://localhost:3000.

Caso tenha problemas com a instalação, você pode ver o app de demonstração no Heroku [aqui](https://mindd.herokuapp.com/).
