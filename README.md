# Twitter Example

Création de l’application :

```bash
rails new twitter-example
cd twitter-example
```

# Création des User

```bash
rails generate scaffold User name:string email:string password_digest:string
```

Ça génère :

- Controllers : `users_controller.rb`
- Models : `user.rb`
- Views :
  - `edit.html.erb`
  - `index.html.erb`
  - `new.html.erb`
  - `show.html.erb`

Le schéma en base :

```ruby
model :user do |t|
  t.string :name
  t.string :email
  t.string :password_digest
```

# Modifier le frontend

`views/users/_form.html.erb`

# Créer un SessionsController

```bash
rails generate controller Sessions
```

# Router les bonnes routes

```ruby
get  '/sign_in', to: 'sessions#sign_in_form'
post '/sign_in', to: 'sessions#sign_in'
```

# Écrire les fonctions `sessions#sign_in_form` et `sessions#sign_in`

# Écrire le front `views/sessions/sign_in_form.html.erb`

# Lancer le serveur

```bash
rails server
```
