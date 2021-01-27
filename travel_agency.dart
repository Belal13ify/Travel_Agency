import 'dart:io';

void main() {
  print('');
  print('\t\t\t\t\t*** Welcome to our Travel Agency ***\n');
  // ignore: omit_local_variable_types
  Trip trip = Trip(id: 0);
  // ignore: omit_local_variable_types
  List<String> choices = [
    '1: Add Trip',
    '2: Edit Trip',
    '3: Delete Trip',
    '4: View Trips',
    '5: Search Trips',
    '6: Reserve Trip',
    '7: Discount',
    '8: Latest Trips',
    '9: View Passengers'
  ];

  do {
    print('');
    sleep(Duration(seconds: 1));
    stdout.write('What do you want to do today?\n');
    print('');
    // put the available choices here
    // ignore: omit_local_variable_types
    for (String item in choices) {
      print(item);
    }
    // ignore: omit_local_variable_types
    int choice = int.parse(stdin.readLineSync());
    switch (choice) {
      case 1:
        {
          print('You have chosen to add a new Trip\n');
          trip.addTrip();
          sleep(Duration(seconds: 1));
          print('Trip has been added');
        }
        break;
      case 2:
        {
          print('You have Choosen to Edit a Trip');
          trip.editTrip();
        }
        break;
      case 3:
        {
          print('You have chosen to Delete a Trip\n');
          sleep(Duration(seconds: 1));
          trip.deleteTrip();
          sleep(Duration(seconds: 2));
        }
        break;
      case 4:
        {
          print('You have chosen to View the Available Trips\n');
          sleep(Duration(seconds: 1));
          print('Here are the Available Trips\n');
          trip.viewTrips();
        }
        break;
      case 5:
        {
          print('You have chosen to Reserve a trip\n');
          trip.searchTrip();
        }
        break;
      case 6:
        {
          print('You have chosen to Reserve a trip\n');
          sleep(Duration(seconds: 1));
          print('Here are the Available Trips\n');
          trip.viewTrips();
          trip.reserveTrip();
        }
        break;
      case 7:
        {
          print('You have chosen to view Trips which have Discount\n');
          sleep(Duration(seconds: 1));
          trip.discount();
        }
        break;
      case 8:
        {
          print('');
          print('Here are the latest 10 Trips');
          print('');
          trip.latestTrips();
        }
        break;
      case 9:
        {
          print(
              'You have chosen to View The total Number of Passenger in all Trips\n');
          sleep(Duration(seconds: 1));
          trip.viewPassengers();
        }
    }
  } while (true);
}

class Trip {
  List<List<dynamic>> trips = [
    [1, 'Cairo', 5, 4, '2021-03-20', 100],
    [2, 'Sydney', 6, 5, '2022-03-25', 200],
    [3, 'London', 7, 0, '2021-08-14', 300],
    [4, 'Ryiad', 8, 4, '2021-07-13', 20500],
    [5, 'Paris', 9, 3, '2021-06-26', 1158],
    [6, 'Vienna', 10, 9, '2021-04-14', 600],
    [7, 'Tokyo', 11, 2, '2021-05-03', 11600],
    [8, 'Berlin', 12, 6, '2021-07-22', 1500],
    [9, 'Greece', 13, 0, '2021-09-14', 900],
    [10, 'Dubai', 14, 7, '2022-11-19', 1000],
    [11, 'Madrid', 15, 9, '2021-08-26', 1158],
    [12, 'Doha', 16, 10, '2022-07-14', 600],
    [13, 'Beirut', 17, 13, '2022-04-09', 600],
    [14, 'Rome', 18, 12, '2021-09-12', 1500],
    [15, 'Quito', 19, 0, '2021-08-25', 900],
    [16, 'Seoul', 20, 5, '2021-06-19', 1000]
  ];
  int id;
  String location;
  int passengerLimit;
  int availableSeats;
  String date;
  double price;

  Trip(
      {this.id,
      this.location,
      this.passengerLimit,
      this.availableSeats,
      this.date,
      this.price});

  void addTrip() {
    id = trips.length + 1;
    stdout.write('Location: ');
    location = stdin.readLineSync();
    stdout.write('Passenger Limit: ');
    passengerLimit = int.parse(stdin.readLineSync());
    stdout.write('available seats: ');
    availableSeats = int.parse(stdin.readLineSync());
    stdout.write('Date ex: 2021-08-20: ');
    date = stdin.readLineSync();
    stdout.write('Price: ');
    price = double.parse(stdin.readLineSync());

    // ignore: omit_local_variable_types
    List trip = [id, location, passengerLimit, availableSeats, date, price];
    trips.add(trip);
  }

  void editTrip() {
    if (trips.isEmpty) {
      print('There is no available Trips to Edit');
    } else {
      print('Here are the Available Trips\n');
      viewTrips();
      stdout.write('Trip ID you want to edit: ');
      id = int.parse(stdin.readLineSync());
      print('You have choosn to edit trip with ID $id');
      stdout.write('New location: ');
      trips[id - 1][1] = stdin.readLineSync();
      stdout.write('New Passenger Limit: ');
      trips[id - 1][2] = int.parse(stdin.readLineSync());
      stdout.write('New number of available seats: ');
      trips[id - 1][3] = int.parse(stdin.readLineSync());
      stdout.write('New Date: ');
      trips[id - 1][4] = stdin.readLineSync();
      stdout.write('New Price: ');
      trips[id - 1][5] = double.parse(stdin.readLineSync());
      print('Trip has been Edited');
      viewTrips();
    }
    print('Here are the List of Trips\n');
    viewTrips();
  }

  void viewTrips() {
    for (List trip in trips) {
      print(
          'ID: ${trip[0]} \t\tLocaion: ${trip[1]}\t\tPassengers: ${trip[2]}\t\tAvailable Seats: ${trip[3]}\t\tDate: ${trip[4]}\t\tPrice: \$${trip[5]}');
    }
  }

  void deleteTrip() {
    print('Here are the List ofTrips\n');
    viewTrips();
    stdout.write('Trip ID you want to Delete: ');
    id = int.parse(stdin.readLineSync());
    trips.removeAt(id - 1);
    print('Trip has been Removed');
    print('Here are the List of Trips\n');
    viewTrips();
  }

  void viewPassengers() {
    int limit = 0;
    int seats = 0;

    if (trips.isEmpty) {
      print('There is no available Trips to view');
    } else {
      print('Here are the List of Trips\n');
      viewTrips();
      print('');
      for (List trip in trips) {
        print(
            'Trip ${trip[0]} has ${trip[2]} seats\t and the Current Passengers are ${trip[2] - trip[3]}\t and the Available seats are ${trip[3]}');
        limit += trip[2];
        seats += trip[3];
      }
      print('');

      print('Total Number of Passengers are ${limit - seats} Passenger ');
    }
    print('');
  }

  void searchTrip() {
    bool priceExist = false;
    stdout.write('Price you want to search for: ');
    price = double.parse(stdin.readLineSync());
    for (List trip in trips) {
      if (trip[5] == price) {
        priceExist = true;
        print(
            'Trip ${trip[0]} has ${trip[2]} seats\t and the Current Passengers are ${trip[2] - trip[3]}\t and the Available seats are ${trip[3]}\tand it\'s price is \$${trip[5]}');
      }
    }
    if (priceExist == false) {
      print('No Available Trip for \$$price');
    }
  }

  void reserveTrip() {
    stdout.write('Trip ID you want to reserve');
    id = int.parse(stdin.readLineSync());
    if (trips[id - 1][3] == 0) {
      print('Sorry there are no available seats in this Trip');
      print('Please choose another Trip');
      viewTrips();
    } else {
      trips[id - 1][3] -= 1;
      print('You have successfully Reserved the trip to ${trips[id - 1][1]}');
    }
  }

  void latestTrips() {
    List latestTrips = trips.skip(trips.length - 10).toList();
    for (List trip in latestTrips) {
      print(
          'ID: ${trip[0]} \t\tLocaion: ${trip[1]}\t\tPassengers: ${trip[2]}\t\tAvailable Seats: ${trip[3]}\t\tDate: ${trip[4]}\t\tPrice: \$${trip[5]}');
    }
  }

  void discount() {
    for (List trip in trips) {
      if (trip[5] > 10000) {
        print(
            'ID: ${trip[0]}\t\tLocaion: ${trip[1]}\t\tPassengers: ${trip[2]}\t\tAvailable Seats: ${trip[3]}\tDate: ${trip[4]}\tCurrent Price: \$${trip[5]}\t New Price:\$${trip[5] - (trip[5] * 0.2)}');
      }
    }
  }
}
