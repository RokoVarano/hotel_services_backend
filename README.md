![](https://img.shields.io/badge/Microverse-blueviolet)

# Hotel Booking app API and DB management
### Front-end access on:
    https://github.com/AdedayoOpeyemi/hotel_services_frontend

> API backend of the project


## Built With

- Ruby on Rails

# Getting started
**You need to have your Postgresql installed and configured to use this project. You also may have to add credentials to <project_root_folder>/config/database.yml**

To get the server up and running in your system, run the following commands from the project's root folder:

```bash
$ bundle install
$ bundle exec rails db:create db:migrate
$ rails s
```

If you want your database to be populated with example data, run (after `bundle exec rails db:create`)
```bash
bundle exec rails db:setup
```

# API Documentation

## List all services

### Endpoint: GET api/v1/services
#### Response
Successful:
Code: 200
Body (example):

```json
{
    "services": [
        {
            "id": 1,
            "name": "pool time",
            "description": "bring your own towel",
            "price": 1000,
            "image_url":  "https://picsum.photos/200/300"
        }
    ]
}
```

**Prices are in USD cents**

## Create a new service
### Endpoint: POST /api/v1/services
#### Request
Header:

```json
{
    "Content-type":  "application/json"
}
```
Body (example):
```json
{
    "name": "pool time",
    "description": "bring your own towel",
    "price": 1000,
    "image_url": "https://picsum.photos/200/300"
}
```
**Prices are in USD cents**

#### Response
Successful:
Code: 201

Body (example):
```json
{
    "messsage": "Service has been created"
}
```

Failure:
Code: 500
Body (example):
```json
{
    "errors": ["Service creation has failed"]
}
```

## Delete a given service
### Endpoint: DELETE /api/v1/services/:id
#### Response
Success:
Code: 202
Body (example):

```json
{
    "message": "Service has been deleted"
}
```

Failure:
Code: 500
Body (example):

```json
{
    "errors": ["Service removal has failed"]
}
```

## List a given user's reservations
### Endpoint: GET api/v1/users/:id/reservations
#### Response
Successful:
Code: 200
Body (example):

```json
{
    "user_id": 1,
    "reservations": [
        {
            "reservation_id": 1,
            "date": {
                "day": 14,
                "month": 4,
                "year": 2021
            }
            "service_name": "Pool time",
            "service_description": "Bring some of your friends",
            "image_url": "https://picsum.photos/200/300",
            "city": "Los Angeles"
        }
    ]
}
```

## Book a given service
### Endpoint: POST /api/v1/users/:user_id/services/:service_id/reservation
#### Request
Header:
```json
{
    "Content-Type": "application/json"
}
```

Body (example):
```json
{
    "date": {
        "day": 14,
        "month": 4,
        "year": 2021
    },
    "city": "Chicago"
}
```

#### Response
Successful:
Code: 201
```json
{
    "message": "Reservation has been created"
}
```

Failure:
Codes:
- 400 for an invalid date given in the request's body
- 404 if either the user_id or service_id do not belong to valid resources
- 500 if we messed up
```json
{
    "errors": ["Reservation creation has failed"]
}
```

## Cancel a reservation
### Endpoint DELETE api/v1/reservations/:id
#### Response
Successful:
Code: 202
Body (example):
```json
{
    "message": "Your reservation has been canceled"
}
```
Failure:
Code:
- 404 if the id url parameter doesn't belong to a valid reservation
- 500 if we messed up
Body (example):
```json
{
    "message": "Your reservation couldn't be canceled"
}
```

## Create User
### Endpoint: POST api/v1/users/

#### Request:
Header:
```json
{
    "Content-Type": "application/json"
}
```

Body (example):
```json
{
    "name": "John"
}
```

#### Response:
Successful:
Code: 201
Body (example):
```json
{
    "message": "User was successfully created",
    "user_id": 42
}
```

Failed:
Code:
- 409 if the username is already taken
- 500 if we messed up
Body (example):
```json
{
    "errors": ["Username already taken"]
}
```
**The error message will return the error cause.**

## Log In
### Endpoint GET /api/v1/users?name=:name
#### Response:
Successful:
Code: 202
Body:
```json
{
    "message": "User Logged In",
    "user_id": 1
}
```

Failed:
Code:
- 401 if the name given as an url parameter does not belong to a valid user
- 500 if we messed up
Body:
```json
{
    "errors": ["User doesn't exist"]
}
```
**The error message will return the error cause.**

### Kanban board
- [Kanban board](https://github.com/RokoVarano/hotel_services_backend/projects/1)
- [Kanban board Screenshoot](https://user-images.githubusercontent.com/57110317/142681121-8060c7cb-3270-4c90-9610-4c150bdc3c84.png)
- In this project we worked in a group of 4 members:

## Authors

👤 **Opeyemi Oyelesi**
- GitHub: [@AdedayoOpeyemi](https://github.com/AdedayoOpeyemi)
- Twitter: [@Oyelesiopy](https://twitter.com/Oyelesiopy)
- LinkedIn: [Opeyemi Oyelesi](https://linkedin.com/in/opeyemioyelesi)

👤 **Lucas Ferrari Soto**

- GitHub: [@notlfish](https://github.com/notlfish)
- Twitter: [@LucasFerrariSo1](https://twitter.com/LucasFerrariSo1)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/lucas-mauricio-ferrari-soto-472a3515a/)

👤 **Rodrigo Ibaceta**
- GitHub: [@RokoVarano](https://github.com/RokoVarano)
- Twitter: [@RodrigoIbacet11](https://twitter.com/RodrigoIbacet11)
- LinkedIn: [rodrigo-ibaceta](https://www.linkedin.com/in/rodrigo-ibaceta/)

👤 **Andres Felipe Castañeda Ramos**
- Github: [@afcastaneda223](https://github.com/afcastaneda223)
- Twitter: [@afcastaneda](https://twitter.com/afcastaneda)
- Linkedin: [Andres Felipe Castañeda](https://www.linkedin.com/in/andcast)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Special thanks to [Murat Korkmaz](https://www.behance.net/muratk) for allowing us to use his [Vespa Design](https://www.behance.net/gallery/26425031/Vespa-Responsive-Redesign)

## 📝 License

This project is [MIT](./MIT.md) licensed.
