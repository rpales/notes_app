# README

## Simple Notes App JSON API

Headers:
'Content-Type: application/json'

### Create user

POST /users.json
```
{ "user": { "email": "example@email.com", "password": "example" } }
```
response:
```
{
  "id": 6,
  "email": "example@email.com",
  "authentication_token": "wyECVCp9PeJXTkdynvVT"
}
```

### User login (get authentication_token)

POST /api/sessions.json
```
{ "session": { "email": "example@email.com", "password": "example" } }
```
response:
```
{
  "id": 6,
  "email": "example@email.com",
  "authentication_token": "wyECVCp9PeJXTkdynvVT"
}
```

Headers:
'Content-Type: application/json', 'X-User-Email: example@email.com', 'X-User-Token: wyECVCp9PeJXTkdynvVT'

### Create a Note

POST /api/notes.json
```
{ "note": { "title": "bu", "content": "bla bla" } }
```

### Get user notes

GET /api/notes.json
