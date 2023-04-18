# Airport-DB-System

In an airport management system, the database is used to keep track of airplanes, their owners, airport information, plane types, airport employees, flight information, airplane’s seat, flight fare, customer information and information about the pilot of the plane.

Each airplane has the total number of seats, a name, year of construction, gas limit, and has a unique registration number, is of a particular plane type.Every plane should have a pilot, but not every pilot has to have an airplane.

The database keeps the information about the planes in plane types. A unique model of the plane, the maximum capacity of the plane, a company name, and the weight of the airplane are stored in the entity named plane type.

Each airplane has an owner. The owner has a unique ID, a name, an address, a purchase date, and a phone number. The owner of the airplane can be a person or a company, there is an owner type to distinguish this.

The records of the airport in which the airplane is located are also kept in the database. Each airport has a unique code, a unique location, a name, airplane capacity, human capacity, and a phone number.

There are employees working at the airport and their information is kept in this database. Each employee has a unique ID, a unique SSN, a name, a salary, a department, and a date of birth.Every pilot is a employee but not every employee has to be pilot.

In this system, every flight is recorded. The airport from which the plane takes off, the airport where the plane will land, the type of plane, the pilot of the plane, the number of passengers, the day of the flight, the planned departure and landing time, the actual take-off and landing time, the airline of the plane, and the registration number of the plane are kept in this entity.

Employees can sell seats to customers based on the availability of seats. Also, the customer can reserve a seat on a particular flight. For the sale of seats, the seat number, the ID of the customer who made the reservation, the registration number of the airplane, and the day of the flight are stored in the system. In addition, for this reservation to be made, the employee must see how many seats are available on that plane. Therefore, the number of empty seats of the airplane should also be kept separately in the system.

Customers must pay for the flight after making their reservation. Therefore, the database also stores the code of the flight, the fare, and the flight restrictions in the fare entity. The fare entity can be associated with both the customer entity and the flight entity.
Every plane needs a pilot to fly. This system also stores the information of the pilot of each flight. The following information about the pilot is stored: the pilot's name, the pilot's unique ID, the pilot's unique license number, the number of flights, the start date, an address, a phone number, and the gender. Pilots can have relationships with the airplane they will fly, with the employee entity, and with the airplane owners. This also means that the pilot can have his/her own plane.

The information of the customer who will fly on the plane is also kept in this system. each passenger must have a name, a telephone number, an address, a specific baggage allowance, a nationality, a date of birth. Also, these customers also have a relationship with the plane they will fly to and the airport.


AIRPLANE(regNumber, planeName, numOfSeats, constructionYear, gasLimit, ownerID, planeModel)

OWNER(ownerID, ownerType, name, address, purchaseDate, phone)

PLANE_TYPE(planeModel, companyName, maxCapacity, weight)

FLIGHT(flightCode, regNumber, flightDate, noOfPassengers, arrTime, depTime, scheduledArrTime, scheduledDepTime, arrAirportCode, depAirportCode, airportCode)

AIRPORT(airportCode, airportLocation, airportName, planeCapacity, humanCapacity, phone) SEAT(seatNo, flightCode, regNumber, emptySeatNo)

CUSTOMER(customerID, customerName, phone, nationality, dateOfBirth, baggage, address) FARE(code, flightCode, regNumber, amount)

EMPLOYEE(employeeID, SSN, employeeName, department, dateOfBirth, salary)

PILOT(pilotID, pilotName, licenseNo, startDate, noOfFlights, address, gender, phone, employeeID)

X OWNS(regNumber, ownerID)

X TYPE_OF(regNumber, planeModel)

X IS(pilotID, employeeID)

X OCCURS(flightCode, airportCode, flightDate, noOfPassengers, arrTime, depTime, scheduledArrTime, scheduledDepTime, arrAirportCode, depAirportCode)

X SEATS(seatNo, flightCode, airportCode, emptySeatNo)

X AIR_FLIGHT(regNumber, flightCode, flightDate, noOfPassengers, arrTime, depTime, scheduledArrTime, scheduledDepTime, arrAirportCode, depAirportCode)

FARES(flightCode, fareCode, regNumber amount) 

FLIES_BY(regNumber,pilotID) LOCATED_IN(airportCode,regNumber)

SELLS(seatNo, flightCode, regNumber,employeeID, emptySeatNo )

WORKS(airportCode, employeeID) HAS(regNumber, seatNo, flightCode, regNumber)

RESERVATION(customerID, customerName, phone, nationality, dateOfBirth, baggage, address, seatNo, flightCode, regNumber, emptySeatNo)





<img width="1092" alt="Ekran Resmi 2023-01-07 21 02 04" src="https://user-images.githubusercontent.com/79667938/211164402-8150e09d-50ca-49b9-860e-abb4708c4427.png">

