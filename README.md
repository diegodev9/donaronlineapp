# DonarOnlineApp

## Instalación
Requerimientos:
- nvm (node version 16.20.1)
- ruby 3.1.2
- rails 6.1.7.4
- postgres 15

```sh
cd donaronlineapp
bundle install
rails db:create
rails db:migrate
rails db:seed
```

## Pruebas con Postman

Las pruebas con postman y el esquema de la db están dentro de /public/postman_tests