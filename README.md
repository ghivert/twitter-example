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

# Lancer le serveur

```bash
rails server
```
