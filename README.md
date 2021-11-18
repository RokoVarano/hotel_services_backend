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

### Endpoint GET api/v1/services
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
            "description": "bring your own towel"
            "time": 1.0,
            "price": USD 10
            "image_url":  "https://picsum.photos/200/300"
            "city": "San Francisco"
        }
    ]
}
```

## L

## List a given user's reservations
### Endpoint GET api/v1/user/:id/reservations

```json
{
    "user_id": 1,
    "reservations": [
        {
            "id": 1,
            "date": {
                "day": 14,
                "month": 4,
                "year": 2021,
                "start": "13:00",
                "end": "14:00"
            }
            "service_id": 1,
        }
    ]
}
```

##

## Getting Started

**This is an example of how you may give instructions on setting up your project locally.**
**Modify this file to match your project, remove sections that don't apply. For example: delete the testing section if the currect project doesn't require testing.**

Coming son

### Prerequisites

### Setup

### Install

### Usage

### Run tests

### Deployment


## Authors

👤 **Author1**

- GitHub: [@githubhandle](https://github.com/githubhandle)
- Twitter: [@twitterhandle](https://twitter.com/twitterhandle)
- LinkedIn: [LinkedIn](https://linkedin.com/in/linkedinhandle)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Special thanks to [Murat Korkmaz](https://www.behance.net/muratk) for allowing us to use his [Vespa Design](https://www.behance.net/gallery/26425031/Vespa-Responsive-Redesign)

## 📝 License

This project is [MIT](./MIT.md) licensed.
