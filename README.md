# Stay Or Go 🚩
## 🔥 🌪 🌦 Table of Contents 🌨 🌀 🔥
* [Introduction](#Introduction)
* [API Endpoints](#API-Endpoints)
* [Database Schema](#Database-Schema)
* [Technologies and Tools](#Technologies-and-Tools)
* [Set Up](#Set-Up)
* [Contributors](#Contributors)
* [Sources](#Sources)
* [Project Specs](#Project-Specs)
* [CircleCi](#CircleCi)

### Introduction
Welcome to the server side of the stayOrGo capstone project. Our goal with project on our server was:
- To consume the National Weather Service api and return cleaned up data to our client side
- Accept user information including phone number and location data from our client side and store it in a database
- Return text messages to a user's phone based on whether or not a disaster is occuring in their geographic location

** Please note as this is a demo using a free Twilio account our website will only accept phone numbers that we have verified **

### API Endpoints
* POST https://stay-or-go-server.herokuapp.com/api/v1/users - *creates a user*

Must be in the following format:
```JSON
{
    "lat": "33.2896",
    "long": "-97.6982",
    "phone": "17204740636"
}
```

* GET /api/v1/disasters - *returns disasters for an area*

Must be in the following format:
* https://stay-or-go-server.herokuapp.com/api/v1/disasters?lat=33.2896&long=-97.6982

**Returns the following when disaster is occuring in the area**
```JSON
{"data": [
    {"id": "2",
    "type": "disaster",
    "attributes": {
        "areas": ["Grand", "Garfield", "hello", "Denver"],
        "coordinates": [
                    [
                        [
                            -81.780000000000001,
                            27.91
                        ],
                        [
                            -81.760000000000005,
                            27.620000000000001
                        ],
                        [
                            -81.840000000000003,
                            27.620000000000001
                        ],
                        [
                            -81.859999999999999,
                            27.91
                        ],
                        [
                            -81.780000000000001,
                            27.91
                        ]
                    ]
                ],
        "type": "Red Flag Warning",
        "certainty": "Observed",
        "severity": "Extreme",
        "urgency": "Immediate",
        "headline": "Your house will burn down in 2.5 seconds if a spark happens to ignite something",
        "description": "Run for your life, your house is about to explode and melt simoultaneously. No need to save your cats, they don't have souls anyways."
        }
    },
    {"id": "5",
    "type": "disaster",
    "attributes": {
        "areas": ["Black", "Red", "Pumpikin Spice", "Is Nice"],
        "coordinates": [
                    [
                        [
                            -81.780000000000001,
                            27.91
                        ],
                        [
                            -81.760000000000005,
                            27.620000000000001
                        ],
                        [
                            -81.840000000000003,
                            27.620000000000001
                        ],
                        [
                            -81.859999999999999,
                            27.91
                        ],
                        [
                            -81.780000000000001,
                            27.91
                        ]
                    ]
                ],
        "type": "Tornado",
        "certainty": "Likely",
        "severity": "Severe",
        "urgency": "Expected",
        "headline": "A big ol tornado is a headin yur way",
        "description": "Get in ur pickup and haul ass outta ther"
        }
    }
]
}
```
**Returns the following when no disaster is occuring**
```JSON
{
    "data": []
}
```

### Database Schema
```Ruby
create_table "users", force: :cascade do |t|
  t.string "email"
  t.string "phone"
  t.string "lat"
  t.string "long"
end
```

### Technologies and Tools
* ![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white)
* ![Rails](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
* ![SQL](https://img.shields.io/badge/GIT-E44C30?style=for-the-badge&logo=git&logoColor=white)
* ![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)
* ![Postgres](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
* ![Heroku](https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white)
* ![Postman](https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=Postman&logoColor=white)
* ![RESTful API](https://img.shields.io/badge/RESTful%20API-%E2%8E%94-brightgreen)
* ![GitHub Projects](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)
* ![GitHub Issues](https://img.shields.io/badge/GitHub%20Projects-%F0%9F%92%BB-lightgrey)
* ![JSON](https://img.shields.io/badge/json-5E5C5C?style=for-the-badge&logo=json&logoColor=white)
* ![VS](https://img.shields.io/badge/Visual_Studio_Code-0078D4?style=for-the-badge&logo=visual%20studio%20code&logoColor=white)

### Set Up

This application runs on:
* Ruby 2.7.2
* Rails 5.2.8

#### Local Setup Instructions:
* Fork and Clone the repo
* Install gem packages: bundle install
* Setup the database: rake db:{drop,create,migrate,seed} (must have Postgres installed)
* Set up the schema and populate seed data: rails db:schema:dump

#### Test Suite

To run the test suit, simply run:
```Ruby
bundle exec rspec spec
```

Simplecov will display total test coverage when running the test suite. You can find a more detailed report by running:  open coverage/index.html

### CircleCi
We had some issues setting up continuous integration using the circleci service. We've narrowed the issue doen to either an issue with how our NWS_Service is interacting with circleci or an issue with our docker images how it interacts with our orb and dependencies. 

#### Contributors
Tyler Caudill  
[![Linkedin Badge](https://img.shields.io/badge/-LinkedIn-blue?style=flat&logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/tyler-caudill-75885b240/)  [![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/TeeCaud)

 Nick Jones   
 [![Linkedin Badge](https://img.shields.io/badge/-LinkedIn-blue?style=flat&logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/nickolas-jones-523b66b7/)  [![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/nlj77)

 Shauna MacFarlane-Okongo    
  [![Linkedin Badge](https://img.shields.io/badge/-LinkedIn-blue?style=flat&logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/shauna-macfarlane-okongo/)  [![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/DrSLMac)

Jonathan Pope    
 [![Linkedin Badge](https://img.shields.io/badge/-LinkedIn-blue?style=flat&logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/jonathan-m-pope/)  [![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/jonathanmpope)

David Stavis    
 [![Linkedin Badge](https://img.shields.io/badge/-LinkedIn-blue?style=flat&logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/dstavis/)  [![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/dstavis)

Mary Turpin    
 [![Linkedin Badge](https://img.shields.io/badge/-LinkedIn-blue?style=flat&logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/mary-turpin-434140150/)  [![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/MaryT573)

#### Mentor
Dara Rockwell    
 [![Linkedin Badge](https://img.shields.io/badge/-LinkedIn-blue?style=flat&logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/dcrockwell/)  [![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/dara-rockwell)


### Sources
* [Postman](https://learning.postman.com/docs/getting-started/introduction/)
* [Stack Overflow](https://stackoverflow.com/)
* [Rails](https://guides.rubyonrails.org/v5.0/active_job_basics.html)
* [Twilio](https://www.twilio.com/docs)
* [Heroku](https://devcenter.heroku.com)
* [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers)

### Project Specs
The project spec & rubric can be found [here](https://mod4.turing.edu/projects/capstone/)
