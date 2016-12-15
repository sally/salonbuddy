# SalonBuddy

```
           _             _               _     _            _    _
 ___  __ _| | ___  _ __ | |__  _   _  __| | __| |_   _     (_)  / )
/ __|/ _` | |/ _ \| '_ \| '_ \| | | |/ _` |/ _` | | | |      | (_/
\__ \ (_| | | (_) | | | | |_) | |_| | (_| | (_| | |_| |     _+/
|___/\__,_|_|\___/|_| |_|_.__/ \__,_|\__,_|\__,_|\__, |    //|\
                                                 |___/    // | )
                                                         (/  |/
```

Welcome to SalonBuddy, the leading tool for hairdressers for keeping track of haircut appointments.

## File Structure

The file structure of SalonBuddy is as follows:

```
controllers
  | list_controller.rb
  | menu_controller.rb
  | schedule_controller.rb
helpers
  | list_helper.rb
  | schedule_helper.rb
models
  | appoinment.rb
  | haircut.rb
  | schedule.rb
  | shampoohaircut.rb
views
  | list_viewer.rb
  | menu_viewer.rb
  | schedule_viewer.rb
environment.rb
Gemfile
README.md
salonbuddy.rb
sample_run.txt
```

### Controllers

The **controllers** folder holds the files that are responsible for responding to user inputs, and accessing models/calling views appropriately.

 * `list_controller.rb`: Accesses the Schedule model to retrieve pending appointments and then passing those to the view
 * `menu_controller.rb`: Master controller which handles main menu activities and prompts the list and schedule controllers when given appropriate user input
 * `schedule_controller.rb`: Accesses Schedule, Appointment models, interacts with the view to get incremental information and create an appointment

### Helpers

The **helpers** folder holds the files that are responsible for formatting certain things for the view, and also validations for model instance creation.

  * `list_helper.rb`: Helps format attributes of Appointment model instances when a user wants to list all appointments
  * `schedule_helper.rb`: Helps format attributes of Appointment model for views, validates format and timing for Appointment creation

### Models

The **models** folder holds the files that are responsible for storage of primary, pertinent data to the program, such as appointments.

  * `appointment.rb`: Maintains data for general appointments, such as client name, start/end times, etc.
  * `haircut.rb`: Inherits from appointment, specifies duration of appointment
  * `schedule.rb`: Maintains data for schedule, holds all created appointments and a time table to tell which time slots are booked
  * `shampoohaircut.rb`: Inherits from appointment, specifies duration of appointment

### Views

The **views** folder holds files responsible for displaying all or a portion of the data to the user. They are primarily called by the controller upon appropriate user input.

  * `list_viewer.rb`: Displays list of all appointments
  * `menu_viewer.rb`: Displays welcome message and main menu options
  * `schedule_viewer.rb`: Displays prompts for appointment creation

### Root

The root folder holds files responsible for setting up the program and its dependencies.

  * `environment.rb`: Consolidates all dependencies and relevant files
  * `Gemfile`: List of all gem dependencies for gem manager Bundler
  * `Gemfile.lock`: Snapshot of all gems in Gemfile along with their associated dependencies
  * `salonbuddy.rb`: Main file for executing program sequence
  * `sample_run.txt`: Contains sample outputs of program sequence

Please reference `sample_run.txt` in the root folder to see a sample program sequence, with intentional typo inputs and attempted double-booking to show validations and formatting features.

## Running SalonBuddy locally

To run SalonBuddy locally, install the Bundler gem to retrieve all dependencies, then execute `salonbuddy.rb`:

  1. Run `gem install bundler` to install the Bundler gem manager
  2. Run `bundle install` to install dependencies
  3. Run `ruby salonbuddy.rb` to initiate SalonBuddy

## Design Decisions

Some design decisions when writing this program involved implementing using the MVC architecture, creating an environment file to consolidate dependencies, and prioritization of appointment attribute validation.

  * **MVC Architecture:** The MVC style allows for separation of concerns when splitting up business logic, data access, and presentation. Further, MVC encourages adherence to conventions, allowing for maintainability and scalability.
  * **Environment File:** In order to use Ruby's DateTime library most efficiently, I had to require some utility provided by Active Support from Rails. Further, I thought it best to require all files from my program in one file. For these two reasons, I created an environment file to meet these two goals.
  * **Prioritization of Appointment Attribute Validation:** I thought it important for certain validations to exist when creating an appointment, including:
    * Proper formatting of date and time
    * Prevent creating appointment in the past
    * Prevent double-booking appointment times

Next steps in continuing with developing SalonBuddy would involve implementing updating/deletion of appointments in the confirmation screen and list screen.
