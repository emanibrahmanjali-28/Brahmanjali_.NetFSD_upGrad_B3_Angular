using System;

namespace ConsoleApp8  
{
    class Program
    {
        // Method that returns Sales and Rating using Tuple
        static (double sales, int rating) GetEmployeeData(double sales, int rating)
        {
            return (sales, rating);
        }

        static void Main()
        {
            Console.Write("Enter Employee Name: ");
            string name = Console.ReadLine();

            Console.Write("Enter Monthly Sales Amount: ");
            double salesAmount = Convert.ToDouble(Console.ReadLine());

            Console.Write("Enter Customer Feedback Rating (1-5): ");
            int rating = Convert.ToInt32(Console.ReadLine());

            if (rating < 1 || rating > 5)
            {
                Console.WriteLine("Invalid rating!");
                return;
            }

            var employeeData = GetEmployeeData(salesAmount, rating);

            string performance = employeeData switch
            {
                ( >= 100000, >= 4) => "High Performer",
                ( >= 50000, >= 3) => "Average Performer",
                _ => "Needs Improvement"
            };

            Console.WriteLine("\n--- Employee Performance Report ---");
            Console.WriteLine($"Employee Name: {name}");
            Console.WriteLine($"Sales Amount: {employeeData.sales}");
            Console.WriteLine($"Rating: {employeeData.rating}");
            Console.WriteLine($"Performance: {performance}");
            Console.ReadLine();
        }
    }
}