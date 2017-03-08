# README

## Simple Notes App JSON API https://notes-app-api.herokuapp.com/

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

POST /sessions.json
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

The following request require user authentication
Headers:
'Content-Type: application/json', 'X-User-Email: example@email.com', 'X-User-Token: wyECVCp9PeJXTkdynvVT'

### Create a Note

POST /notes.json
```
{ "note": { "title": "bu", "content": "bla bla" } }
```

### Get user notes

GET /notes.json
