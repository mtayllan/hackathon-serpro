# Mind

Mind é uma **aplicação web** que permite que qualquer possa encontrar, facilmente, o hospital ideal para ser tratado.

## Versões

* Ruby 2.6.5
* Rails 6.0.3
* Database PostgreSQL
* Yarn


## Iniciando o projeto
O projeto foi feito em [Ruby on Rails](https://rubyonrails.org/), um framework feito para a linguagem [Ruby](https://www.ruby-lang.org/pt/).

Para iniciálo, é necessário que:
* Tenha o Ruby instalado na máquina (recomendado uso de [rbenv](https://github.com/rbenv/rbenv) ou [rvm](https://rvm.io/))
* Depois, é necessário instalar e configurar o postgres para que seja possível criar o banco de dados.
Existe um [tutorial geral de como iniciar um projeto em rails](https://www.digitalocean.com/community/tutorials/how-to-set-up-ruby-on-rails-with-postgres) que pode ajudar.

Depois disso, basta
* Ter o [git](https://linuxize.com/post/how-to-install-git-on-ubuntu-18-04/) na máquina
* Ter o [yarn](https://linuxize.com/post/how-to-install-git-on-ubuntu-18-04/) na máquina

Depois, basta rodar os comandos:
```bash
git clone [url do repositório]

gem install bundle

bundle

rails db:create db:migrate

yarn
```

Ele deve baixar todas as dependências do projeto (gems e módulos do node) e ter criado o banco de dados com sucesso.

Caso queira, inicialmente, popular o banco de dados, rode `rails db:seed`.

E, enfim, é possível levantar a aplicação localmente utilizando o comando `rails server` e visitando [http://localhost:3000/](http://localhost:3000/).