# automation-test-capybara
BDD Software Automation Testing using capybara ruby, and cucumber.

## Approach
The framework follows the following approach:

1. Page Object Model (POM): The application's UI is divided into pages, and each page has its corresponding Page Object. This approach enhances code reusability and maintenance.

2. Cucumber Features and Scenarios: Test scenarios are written using Gherkin syntax in feature files. Each scenario corresponds to a Cucumber step definition.

3. Step Definitions: Step definitions are written using Capybara and Selenium to interact with the application and perform verifications.

4. Assertions and Verifications: Assertions and verifications are placed within step definitions to ensure the application behaves as expected.

5. Reporting: Cucumber generates human-readable HTML reports containing detailed test execution results.

## Tech Stack
1. Ruby (Programming Language)
2. Capybara (Web Automation)
3. Selenium (WebDriver)
4. Cucumber (Behavior-Driven Development)
5. Bundler (Dependency Management)

## Minimum Prerequisites
1. Ruby installed (version 3.2.2 is used for this repository)
2. Chrome or Firefox browser installed

## Installation
For more details how to install and setup
## How to Setup (Mac)

1. Install [Homebrew](https://brew.sh/)

  ```bash
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  ```

2. Install [RVM](https://rvm.io/)

  ```bash
  curl -L get.rvm.io | bash -s stable
  source ~/.bash_profile
  ```

  Then run `rvm requirements` and follow the instructions

3. Install Ruby 3.2.2

  ```bash
  rvm install 3.2.2
  ```
  And make sure you have used the right version

  ```bash
  rvm list
  ```

  To use the version 3.2.2

  ```bash
  rvm use 3.2.2
  ```

4. Clone the project

  ```bash
  git clone git@github.com:fathirwafda/automation-test-capybara.git
  cd automation-test-capybara
  ```

5. Copy .env file

  ```bash
  cp env.sample .env
  ```

6. Install [bundler](http://bundler.io/)

  ```bash
  gem install bundler
  ```

7. Run bundle install

  ```bash
  bundle install # or `bundle` for simpler command
  ```
8. Copy env (This .env can be used for store your value to be more flexible)

  ```bash
  cp env.sample .env
  ```
9. Go back to task_capybara_cucumber folder and run cucumber to make sure everything is installed

   ```bash
    bundle exec cucumber -p web-desktop --tag @purchase-product
   ```

## Common Errors

* JSON error when running `bundle`, update your XCode or run `xcode-select --install`


## Running Tests
1. Update the test data: Modify the test data, if required
2. Run the tests using Cucumber:

```
bundle exec cucumber -p web-desktop --tag @purchase-product
```
3. If you want to generate Cucumber reports:
```
bundle exec cucumber -p web-desktop --tag @purchase-product -f pretty -f html -o report.html -f json -o report.json
```
And open report.html by using a browser

## Profiles
Profile configuration : config/cucumber.yml

| Platform                    | Command                                             |
|-----------------------------|-----------------------------------------------------|
| **Desktop**                 | `bundle exec cucumber -p web-desktop`               |

## Folder Structure

```
├── config
├── features
│   ├── helper
│   ├── pages
│   │   
│   ├── scenarios
│   │   └── web
|   |
│   ├── step_definitions
│   ├── screenshots
|   ├── .env
```