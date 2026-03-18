using System;

namespace ConsoleApp8
{
    // Base Class
    class Vehicle
    {
        // Encapsulation (properties)
        public string Brand { get; set; }
        public double RentalRatePerDay { get; set; }

        // Virtual method (for polymorphism)
        public virtual double CalculateRental(int days)
        {
            return RentalRatePerDay * days;
        }
    }

    // Derived Classes
    class Car : Vehicle
    {
        public override double CalculateRental(int days)
        {
            double total = RentalRatePerDay * days;

            total += 500;

            return total;
        }
    }

    
    class Bike : Vehicle
    {
        public override double CalculateRental(int days)
        {
            double total = RentalRatePerDay * days;

           
            total = total - (total * 0.05);

            return total;
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter Vehicle Type (Car/Bike): ");
            string type = Console.ReadLine().ToLower();

            Vehicle vehicle = null;

            // Runtime Polymorphism
            if (type == "car")
            {
                vehicle = new Car();
            }
            else if (type == "bike")
            {
                vehicle = new Bike();
            }
            else
            {
                Console.WriteLine("Invalid vehicle type!");
                return;
            }

            Console.Write("Enter Brand: ");
            vehicle.Brand = Console.ReadLine();

            Console.Write("Enter Rental Rate Per Day: ");
            vehicle.RentalRatePerDay = Convert.ToDouble(Console.ReadLine());

            Console.Write("Enter Number of Days: ");
            int days = Convert.ToInt32(Console.ReadLine());

            
            if (days <= 0)
            {
                Console.WriteLine("Invalid number of days!");
                return;
            }

           
            double totalRental = vehicle.CalculateRental(days);

            Console.WriteLine("Total Rental = " + totalRental);
        }
    }
}