# LaWay - API CEPs
Essa aplicação foi desenvolvida em Ruby on Rails, e tem como objetivo retornar os dados de um endereço completo utilizando um CEP. 
O apiCEP foi utilizado para fazer a consulta.

## Passo 1 - Instalação
1. Clone o repositório do github
```sh
$git clone git@github.com:juguerreiro/laway-api.git
```

2. Para instalação, rode esses comandos no seu terminal:

```ruby
$ bundle install
```
```ruby
$ rails db:migrate
```
```ruby
$ rails db:seed
```

## Passo 2 - Credenciais
1. Log in: um login padrão foi criado dentro do seed, credenciais de acesso:

```sh
email: "tests@laway.com"
token: "123456"
```
2. Acesse o console para ter acesso a informação de token do usuário(authentication_token)
```ruby
$ rails console
$ User.last
```
2. Endpoint para gerar um usuário com um novo token de autenticidade **automaticamente**
```ruby
$ rails console
$ User.create(email: "SEU_EMAIL", password: "SUA_SENHA")
```

## Passo 3 - Postman
1. Passe as informações a seguir nos headers
```sh                                   
Content-Type: application/json     
X-User-Email: email         
X-User-Token: authentication_token                 
```
2. Passe as informações a seguir no body (tipo:JSON)
```sh
{ "cep": "87013-010" }
# passar o cep neste formato
```
3. Após inicie o servidor
```ruby
$ rails server
```
4. Endpoint para buscar um CEP e guarda-lo em seu banco de dados
```sh
# Método POST
http://localhost:3000/api/v1/ceps
# substituir 'http://localhost:3000' pela sua url padrão
```
5. Endpoint para mostrar todos os CEPs cadastrados no usuário
```sh
# Método GET
http://localhost:3000/api/v1/ceps
# substituir 'http://localhost:3000' pela sua url padrão
```

## Passo 4 - Testes
1. Para rodar os testes 
```ruby
$ bundle exec rspec
```
