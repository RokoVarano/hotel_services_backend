![](https://img.shields.io/badge/Microverse-blueviolet)

# Hotel Booking app API and DB management

> API backend of the project

![screenshot](./app_screenshot.png)

Additional description about the project and its features.

## Built With

- Ruby on Rails
- React
- Redux


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
    "description": "bring your own towell",
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
    "message": "Service creation has failed"
}
```

## Delete a given service
### Endpoint: DELETE /api/v1/service/:id
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
    "message": "Service removal has failed"
}
```

## List a given user's reservations
### Endpoint: GET api/v1/user/:id/reservations
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
### Endpoint: POST /api/v1/user/:user_id/services/:service_id/reservation
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
Code: 500
```json
{
    "message": "Reservation creation has failed"
}
```

## Cancel a reservation
### Endpoint DELETE api/v1/reservation/:id
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
Code: 500
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
Code: 500
Body (example):
```json
{
    "error": "Username already taken"
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
Code: 500
Body:
```json
{
    "error": "User doesn't exit"
}
```
**The error message will return the error cause.**

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
