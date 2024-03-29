![](https://i.imgur.com/9GVyOgQ.png)

# Mind

EN:
**Mind is a Web Application made in Ruby on Rails for the HACKATHON SERPRO Nº 01/2020, a national competition promoted by Brazilian state owned company [Serpro](https://www.serpro.gov.br/en/about-serpro). The app goal is to present to the user all health providers available nearby and show information about their current capacity and medical specialties, so the user can decide quickly to which hospital or clinic they need to go, specially when travelling.**

**It earned 9th place on the national competition.**

Mind (do inglês, cuidar) é uma **aplicação web** com adaptação para PWA (Progressive Web App) que permite que qualquer pessoa possa encontrar uma unidade de saúde ideal e mais próxima para ser atendido.

## Construção da Solução
Para realizar construções em relação a qual setor iriamos atacar, além do problema e da solução, utilizamos o
[Miro](https://miro.com/app/board/o9J_kr9kilE=/). Os analistas de negócios também utilizaram para a construção das Personas, Business Model Canvas, Pitchs Iniciais e o Roteiro da Apresentação Final.

Link do Miro: https://miro.com/app/board/o9J_kr9kilE=/

## Identidade Visual
Para a montagem da logo usamos o Adobe Photoshop CC. Para a seleção da paleta de cores usamos o Paletton.

Link da Paleta de Cores: http://paletton.com/#uid=53f0f0kmSQJbHXjhQU3rHMxA+GM

Ícones foram buscados no [IconFinder](https://www.iconfinder.com/) tendo coletado apenas ícones gratuitos.

Imagens foram buscadas no [Pixabay](https://pixabay.com/pt/) tendo coletado apenas imagens gratuitas.

## Prototipação
A prototipação foi voltada para a construção das telas de usuário (paciente), relacionada a busca e exibição das unidades de saúde. Além disso, foi feita apenas a prototipação do painel inicial para o administrador das unidades, proporcionando uma atualização rápida das informações relacionadas ao pronto-atendimento.

A prototipação foi de alta fidelidade e utilizamos o [Figma](https://www.figma.com/).

Link da prototipação desenvolvida:
https://www.figma.com/file/AGANQbe8riuWGoYh0EM1dv/Mind?node-id=0%3A1

A modelagem inicial do banco de dados: https://dbdiagram.io/d/5ee7e9359ea313663b3a97ea

## Tecnologias

* [Ruby 2.6.5](https://www.ruby-lang.org/pt/)
* [Rails 6.0.3](https://rubyonrails.org/)
* [PostgreSQL](https://www.postgresql.org/)
* [Yarn](https://yarnpkg.com/)

## Templates e Layouts

* [Shards](https://designrevision.com/demo/shards/)
* [SB Admin 2](https://github.com/StartBootstrap/startbootstrap-sb-admin-2)
* Bootstrap
* Font Awesome

## Bases de dados

Para popular o banco de dados, utlizamos os dados que estão no arquivo [db/seeds.rb](db/seeds.rb), que puxa um CSV ([Dados.csv](lib/assets/Dados.csv)), além da biblioteca chamada *Faker*, que gera dados pseudo-aleatórios.
O CSV contém o nome e endereços reais de hospitais da cidade de Fortaleza-CE, porém todo o resto das informações são fictícias.

## APIs

Para localização, utilizamos a api aberta do OpenStreet.
https://nominatim.openstreetmap.org/

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

1. Para usar o projeto com docker, é necessário ter instalado o [Docker](https://github.com/docker/docker-ce) e o [Docker compose](https://github.com/docker/compose)

2. Dê checkout na branch *docker* (`git checkout docker`)

3. Execute os seguintes comandos:
```bash
docker-compose build

docker-compose run app \
bundle install && \
yarn install

docker-compose run app bundle exec rails db:create db:migrate db:seed

```
4. Levante o servidor com `docker-compose up` e visite http://localhost:3000.

Caso tenha problemas com a instalação, você pode ver o app de demonstração no Heroku [aqui](https://mindd.herokuapp.com/).

## Credenciais

Após popular o banco de dados com os dados de teste,
é possível acessar o painel do Administrador e do Usuário da Organização de saúde utilizando as credencias:

#### Administrador da plataforma

Email: `a@a`

Senha: `qwe123`

Endereço: /admin

Heroku: https://mindd.herokuapp.com/admin

Local: http://localhost:3000/admin

#### Administrador da unidade

Email: `u@u`

Senha: `qwe123`

Endereço: /organization_users/sign_in

Heroku: https://mindd.herokuapp.com/organization_users/sign_in

Local: http://localhost:3000/organization_users/sign_in

## Apresentação
* Link da Apresentação no Youtube: https://youtu.be/DpAy1pU13bs
* Link da Landing Page: https://mindd.herokuapp.com/
* [Pitch Deck](Pitch%20-%20Serpro.pdf) (nesse repositório)

## Equipe
Iury Rosal - Líder, Analista de Negócios e UX

Vinicius Almeida - Analista de Negócios e UX

Laura Santiago - Desenvolvedora

Tomás Coelho - Desenvolvedor

Messias Tayllan - Desenvolvedor
