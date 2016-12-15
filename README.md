# SalonBuddy

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
  * `schedule.rb`: 
  * `shampoohaircut.rb`: Inherits from appointment, specifies duration of appointment
