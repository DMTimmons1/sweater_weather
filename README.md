<a name="readme-top"></a>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]




<br />

<h3 align="center">Sweater Weather</h3>

  <p align="center">
    An API service that retrieves current weather, daily weather, and hourly weather by geographical location.
    <br>
    <!-- <a href="https://github.com/github_username/repo_name"><strong>Explore the docs »</strong></a> -->
    <!-- <br /> -->
    <!-- <br /> -->
    <!-- <a href="https://github.com/github_username/repo_name">View Demo</a> -->
    <!-- · -->
    <a href="https://github.com/pantry-wizard/pantry_wizard_be/issues">Report Bug</a>
    ·
    <a href="https://github.com/pantry-wizard/pantry_wizard_be/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
        <li><a href="#api-key-setup">Api Key Setup</a></li>
        <li><a href="#testing-with-rspec">Testing With RSpec</a></li>
      </ul>
    </li>
    <li><a href="#available-endpoints">Available Endpoints</a></li>
        <ul>
        <li><a href="#forecast-endpoint">Forecast Endpoint</a></li>
        <li><a href="#user-endpoint">User Endpoint</a></li>
        <li><a href="#session-endpoint">Session Endpoint</a></li>
      </ul>
    <li><a href="#goals">Goals</a></li>
    <li><a href="#database-schema">Database Schema</a></li>
    <!-- <li><a href="#usage">Usage</a></li> -->
    <!-- <li><a href="#roadmap">Roadmap</a></li> -->
    <!-- <li><a href="#contributing">Contributing</a></li> -->
    <!-- <li><a href="#license">License</a></li> -->
    <!-- <li><a href="#contact">Contact</a></li> -->
    <!-- <li><a href="#acknowledgments">Acknowledgments</a></li> -->
  </ol>
</details>


<br>

<!-- ABOUT THE PROJECT -->
## About The Project
<br>

This project utilizes the MapQuest API geocoding endpoint to retrieve the lattitude and longititute for a given location. These coordinates are then fed through to the WeatherAPI service to retrive the current weather, daily weather for the next 5 days, and the hourly weather. This data is then provided in the forecast endpoint. 

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With:

* [![Ruby]][Ruby-url] **3.1.1**
* [![Rails]][Rails-url] **7.0.4**
* [![Postgresql]][Postgresql-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

This is a Ruby on Rails application which establishes API endpoints to be called in an application like <a href="https://www.postman.com/">Postman</a>. To get started, please follow the directions below.

<br>

### Installation

1. Clone the repo:
   ```bash
   git clone git@github.com:DMTimmons1/sweater_weather.git
   ```

2. Install gems:
   ```bash
   bundle install
   ```

3. To establish the database, run:
   ```bash
   rails db:{drop,create,migrate}
   ```

4. To start up the local rails server, run:
   ```bash
   rails server
   ```
<br>

  Visit http://localhost:3000 in a web browser to confirm that the app is running, or use an application such as Postman to make your API calls and confirm the responses are accurate. 

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br>

### API Key Setup
In order to use this application you will API keys from both <a href="https://developer.mapquest.com/documentation/"> `MapQuest` </a> and the <a href="https://www.weatherapi.com/docs/#intro-request"> `WeatherAPI` </a>.

Once you have these keys, they will be stored in the `application.yml` file that you create.

1. Run `bundle exec figaro install`, then open the `application.yml` file. Here you'll add your `mapquest_key` and `weather_api_key`.
```bash
    mapquest_key: xxxxxxxxxxxxxxxxxxxxxxxxxxxx
    weather_api_key: xxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br>

### Testing with RSpec

Once `sweater_weather` is correctly installed, run tests locally to ensure the repository will work as intended.

<br>

  To test the entire RSpec suite, run:
   ```bash
   bundle exec rspec
   ```

<br>

All tests should be passing if the installation was successful. 

If any tests are not passing, please report which tests are not passing <a href="https://github.com/DMTimmons1/sweater_weather/issues">Here</a>. We will issue an update/fix as soon as possible!


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br>


## Available Endpoints
- This API can be called locally using a program like [Postman](https://www.postman.com).

- *Note:* Necessary parameters marked with {}

<br>

### __Forecast__ __Endpoint__

<br>

### 1. Get forecast for a given location
<br>

*Note:* pass `location` as a paramater within this endpoint. the location should follow the format: 'City,State(Abbreviated)' ex: 'Denver,CO'


```bash
GET '/api/v1/forecast?location=<location>'
```

   
Response:
```bash
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "last_updated": "LAST_UPDATED",
                "temperature": "TEMPERATURE",
                "feels_like": "FEELS_LIKE",
                "humidity": "HUMIDITY",
                "uvi": "UVI",
                "visibility": "VISIBILITY",
                "conditions": "CONDITIONS",
                "icon": "ICON_IMG_LINK"
            },
            "daily_weather": [
                {
                    "date": "DATE",
                    "sunrise": "SUNRISE",
                    "sunset": "SUNSET",
                    "max_temp": "MAX_TEMP",
                    "min_temp": "MIN_TEMP",
                    "condition": "CONDITIONS",
                    "icon": "ICON_IMG_LINK"
                }
            ],
            "hourly_weather": [
                {
                    "time": "TIME",
                    "temperature": "TEMPERATURE",
                    "conditions": "CONDITIONS",
                    "icon": "ICON_IMG_LINK"
                }
            ]
        }
    }
}
```

*Note:* this response will return daily weather for 5 days and hourly weather for the next 24 hours. Only one is provided for each as an example of what the response looks like.

<br>

## __User__ __Endpoint__ 
<br>

### 1. Create a User
<br>

```bash 
POST 'api/vi/users/'
```

*Note:* this endpoint will require the paramaters of the user passed into the body of the request as raw JSON. The formatting for this is shown below.

```bash 
{
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```

*Note:* Since we are passing this data in the body of the request as raw JSON, you will need to add the following headers to your request as well.

```bash 
    Content-Type: applicaton/json
    Accept: application/json
```

Response:

```bash 
{
    "data": {
        "id": "ID",
        "type": "users",
        "attributes": {
            "email": "USER_EMAIL",
            "api_key": "GENERATED_API_KEY"
        }
    }
}
```

## __Session__ __Endpoint__
<br>

### 1. Create a Session
<br>

```bash 
POST 'api/vi/sessions'
```

*Note:* this endpoint will require the paramaters of the user passed into the body of the request as raw JSON. This request only requires the email and password of an existing user. The formatting for this is shown below.

```bash 
{
  "email": "whatever@example.com",
  "password": "password"
}
```

*Note:* Since we are passing this data in the body of the request as raw JSON, you will need to add the following headers to your request once again.

```bash 
Content-Type: applicaton/json
Accept: application/json
```

Response:

```bash 
{
    "data": {
        "id": "1",
        "type": "users",
        "attributes": {
            "email": "USER_EMAIL",
            "api_key": "USER_API_KEY"
        }
    }
}
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Goals

Sweater weather was created to satisfy the Turing Mod 3 final project. 

See the official project requirements [here](https://backend.turing.edu/module3/projects/sweater_weather/requirements).

<br>

### Learning Goals
- Consume multiple external APIs, and create functionallity using the return from one API, to get a specific   return from another.
- Expose an API that creates an API key upon user creation.
- Expose an API that creates sessions based on the user login information.
- Demonstrate REST and CRUD fundamentals.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<br>

## Database Schema

<img src="https://user-images.githubusercontent.com/117066950/234626170-34eb1e74-750b-475e-8a54-804c1d377e11.png">

<br>

## Project By:
<table>
  <tr>
    <td><img src="https://avatars.githubusercontent.com/u/117066950?s=120&v=4"></td>
  </tr>
  <tr>
    <td>Dawson Timmons</td>
  </tr>
  <tr>
    <td>
        <a href="https://github.com/DMTimmons1">GitHub</a><br>
        <a href="https://www.linkedin.com/in/dawson-timmons/">LinkedIn</a>
    </td>
  </tr>
</table>


<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/DMTimmons1/sweater_weather.svg?style=for-the-badge
[contributors-url]: https://github.com/DMTimmons1/sweater_weather/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/DMTimmons1/sweater_weather.svg?style=for-the-badge
[forks-url]: https://github.com/DMTimmons1/sweater_weather/network/members
[stars-shield]: https://img.shields.io/github/stars/DMTimmons1/sweater_weather.svg?style=for-the-badge
[stars-url]: https://github.com/DMTimmons1/sweater_weather/stargazers
[issues-shield]: https://img.shields.io/github/issues/DMTimmons1/sweater_weather.svg?style=for-the-badge
[issues-url]: https://github.com/DMTimmons1/sweater_weather/issues
[license-shield]: https://img.shields.io/github/license/DMTimmons1/sweater_weather.svg?style=for-the-badge
[license-url]: https://github.com/DMTimmons1/sweater_weather/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/linkedin_username
[product-screenshot]: images/screenshot.png
[Ruby]: https://img.shields.io/badge/ruby-000000?style=for-the-badge&logo=ruby&logoColor=red
[Ruby-url]: https://www.ruby-lang.org/en/
[Rails]: https://img.shields.io/badge/rails-red?style=for-the-badge&logo=rubyonrails&logoColor=white&color=red
[Rails-url]: https://rubyonrails.org/
[Postgresql]: https://img.shields.io/badge/postgresql-3386FF?style=for-the-badge&logo=postgresql&logoColor=FFFFFF
[Postgresql-url]: https://www.postgresql.org/
[Heroku]: https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white
[Heroku-url]: https://www.heroku.com/